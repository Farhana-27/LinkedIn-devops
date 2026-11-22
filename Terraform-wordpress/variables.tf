variable "aws_region" {
  description = "AWS region where all resources will be created"
  type        = string
  default     = "eu-west-2"
}

variable "instance_type" {
  description = "EC2 instance type for the WordPress server"
  type        = string
  default     = "t3.micro"
}

variable "project_name" {
  description = "Name used to prefix and tag all resources"
  type        = string
  default     = "terraform-wordpress"
}

variable "my_ip" {
  description = "Your public IP in CIDR notation (e.g. 81.2.69.142/32), allowed to SSH in"
  type        = string
}

variable "db_name" {
  description = "Name of the MySQL database for WordPress"
  type        = string
  default     = "wordpress"
}

variable "db_user" {
  description = "MySQL user that WordPress connects as"
  type        = string
  default     = "wpuser"
}

variable "db_password" {
  description = "Password for the WordPress MySQL user"
  type        = string
  sensitive   = true

}