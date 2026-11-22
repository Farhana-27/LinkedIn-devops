variable "aws_region" {
  description = "AWS region where all resources will be created"
  type        = string
  default     = "eu-north-1"
}

variable "instance_type" {
  description = "EC2 instance type for the WordPress server"
  type        = string
  default     = "t3.micro"
}