variable "name" {
  description = "Name prefix for all resources in this module"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "user_data_base64" {
  description = "Base64-encoded (optionally gzipped) cloud-init user data"
  type        = string
}

variable "ssh_cidr" {
  description = "CIDR allowed to SSH in (e.g. x.x.x.x/32)"
  type        = string
}

variable "public_key_path" {
  description = "Path to the SSH public key to upload"
  type        = string
}
