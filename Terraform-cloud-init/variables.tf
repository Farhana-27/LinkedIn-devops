variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name used to prefix and tag all resources"
  type        = string
  default     = "terraform-cloud-init"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "owner_name" {
  description = "Name shown on the web page"
  type        = string
  default     = "Farhana"
}

variable "my_ip" {
  description = "Your public IP in CIDR form (x.x.x.x/32), allowed to SSH in"
  type        = string

  validation {
    condition     = can(cidrhost(var.my_ip, 0)) && endswith(var.my_ip, "/32")
    error_message = "my_ip must be a single IPv4 address in CIDR form, e.g. 81.2.69.142/32."
  }
}

variable "public_key_path" {
  description = "Path to the SSH public key to upload"
  type        = string
  default     = "~/.ssh/terraform-wordpress.pub"
}
