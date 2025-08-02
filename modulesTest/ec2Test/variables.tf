variable "key_name" {
  type = string
  default = "ec2-key-from-terraform"
  description = "key name"
}

variable "vpc_name" {
  type = string
  default = "my-custom-vpc"
}

variable "subnet_name" {
  type = string
  default = "my-custom-vpc-public-1"
}

variable "sg_name" {
  type = string
  default = "my-custom-sg"
}

variable "ami_id" {
  type = string
  default = "ami-020cba7c55df1f615" # Ubuntu 24.04
}
variable "SHH_ingress_rule" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })

  default = {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "HTTPS_ingress_rule" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })

  default = {
    description = "Allow HTTPS"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

variable "egress_rule" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })

  default = {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}