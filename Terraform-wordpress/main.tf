terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Security group (the firewall around the EC2 instance)
resource "aws_security_group" "wordpress_sg" {
  name        = "${var.project_name}-sg"
  description = "Allow HTTP from anywhere and SSH from my IP"

  tags = {
    Name = "${var.project_name}-sg"
  }
}

# Inbound: HTTP (port 80) from anywhere, so visitors can reach WordPress
resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.wordpress_sg.id
  description       = "HTTP from anywhere"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

# Inbound: SSH (port 22) from my IP only, for troubleshooting
resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.wordpress_sg.id
  description       = "SSH from my IP only"
  cidr_ipv4         = var.my_ip
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

# Outbound: allow everything, so the server can download packages and WordPress
resource "aws_vpc_security_group_egress_rule" "all_outbound" {
  security_group_id = aws_security_group.wordpress_sg.id
  description       = "Allow all outbound traffic"
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}

# SSH key pair: uploads my public key so I can SSH into the instance
resource "aws_key_pair" "wordpress_key" {
  key_name   = "${var.project_name}-key"
  public_key = file(pathexpand(var.public_key_path))
}

# EC2 instance: the server that runs WordPress
resource "aws_instance" "wordpress" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.wordpress_key.key_name
  vpc_security_group_ids      = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/user_data.sh", {
    db_name     = var.db_name
    db_user     = var.db_user
    db_password = var.db_password
  })
  user_data_replace_on_change = true

  root_block_device {
    volume_type = "gp3"
    volume_size = 8
    encrypted   = true
  }

  metadata_options {
    http_tokens = "required"
  }

  tags = {
    Name = "${var.project_name}-server"
  }
}

