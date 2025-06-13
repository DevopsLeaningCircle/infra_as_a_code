provider "aws" {
  region = "us-east-1"
}

module "aws_key_pair" {
  source = "../../modules/aws_key_pair"
  key_name = var.key_name
  public_key = tls_private_key.ssh.public_key_openssh
}

# Generate SSH key pair
resource "tls_private_key" "ssh" {
  algorithm = "RSA"
  rsa_bits = 4096
}

# Save private key to local file 
resource "local_file" "private_key" {
  content = tls_private_key.ssh.private_key_pem
  filename = "${path.module}/keys/${var.key_name}"
  file_permission = "0600"
  directory_permission = "0700"
}

# Save public key to local file
resource "local_file" "public_key" {
  content = tls_private_key.ssh.public_key_openssh
  filename = "${path.module}/keys/${var.key_name}.pub"
  file_permission = "0644"
  directory_permission = "0700"
}