output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.wordpress.id
}

output "public_ip" {
  description = "Public IP address of the WordPress server"
  value       = aws_instance.wordpress.public_ip
}

output "public_dns" {
  description = "Public DNS name of the WordPress server"
  value       = aws_instance.wordpress.public_dns
}

output "wordpress_url" {
  description = "Open this in a browser to reach WordPress"
  value       = "http://${aws_instance.wordpress.public_ip}"
}

output "ssh_command" {
  description = "Command to SSH into the server for troubleshooting"
  value       = "ssh -i ~/.ssh/terraform-wordpress ubuntu@${aws_instance.wordpress.public_ip}"
}
