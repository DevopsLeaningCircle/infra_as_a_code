provider "aws" {
  region = "us-east-1"
}

data "aws_key_pair" "aws_key" {
  key_name = var.key_name
}

# Get VPC ID
data "aws_vpc" "my_custom_vpc" {
  filter {
    name = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public_subnet" {
  
  filter {
    name = "tag:Name"
    values = [var.subnet_name]
  }
}

resource "aws_security_group" "sg" {
  name = var.sg_name
  description = "Allow SSH and HTTPS"
  vpc_id = data.aws_vpc.my_custom_vpc.id

  ingress {
    description = var.SHH_ingress_rule.description
    from_port = var.SHH_ingress_rule.from_port
    to_port = var.SHH_ingress_rule.to_port
    protocol = var.SHH_ingress_rule.protocol
    cidr_blocks = var.SHH_ingress_rule.cidr_blocks
  }
  ingress {
    description = var.HTTPS_ingress_rule.description
    from_port   = var.HTTPS_ingress_rule.from_port
    to_port     = var.HTTPS_ingress_rule.to_port
    protocol    = var.HTTPS_ingress_rule.protocol
    cidr_blocks = var.HTTPS_ingress_rule.cidr_blocks
  }

  egress {
    description = var.egress_rule.description
    from_port   = var.egress_rule.from_port
    to_port     = var.egress_rule.to_port
    protocol    = var.egress_rule.protocol
    cidr_blocks = var.egress_rule.cidr_blocks
  }

  tags = {
    Name = "ec2-security-group"
  }
}

module "ec2_instance" {
  source = "../../modules/ec2_instance"
  instance_type = "t2.micro"
  ami = var.ami_id
  key_name = data.aws_key_pair.aws_key.key_name
  subnet_id = data.aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  associate_public_ip_address = true
}