output "ami_id" {
  description = "ID of the Ubuntu AMI found by the data source"
  value       = data.aws_ami.ubuntu.id
}