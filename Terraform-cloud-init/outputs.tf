output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.web.instance_id
}

output "public_ip" {
  description = "Public IP of the web server"
  value       = module.web.public_ip
}

output "website_url" {
  description = "Open in a browser (http, not https)"
  value       = "http://${module.web.public_ip}"
}

output "health_url" {
  description = "Health check endpoint"
  value       = "http://${module.web.public_ip}/health"
}

output "ssh_command" {
  description = "SSH command, using only this key"
  value       = "ssh -o IdentitiesOnly=yes -i ~/.ssh/terraform-wordpress ubuntu@${module.web.public_ip}"
}

output "cloud_init_rendered" {
  description = "The cloud-init YAML after Terraform filled in the template (before gzip/base64)"
  value       = local.cloud_init_yaml
}
