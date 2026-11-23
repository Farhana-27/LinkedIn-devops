provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project   = var.project_name
      ManagedBy = "Terraform"
    }
  }
}

# 1. Fill in the cloud-init template with Terraform values
locals {
  cloud_init_yaml = templatefile("${path.module}/cloud-init/web.yaml.tftpl", {
    project_name = var.project_name
    owner_name   = var.owner_name
  })
}

# 2. Package it: MIME multi-part, gzip, base64
data "cloudinit_config" "web" {
  gzip          = true
  base64_encode = true

  part {
    filename     = "web.yaml"
    content_type = "text/cloud-config"
    content      = local.cloud_init_yaml
  }
}

# 3. Build the web server from the module
module "web" {
  source = "./modules/ec2_web"

  name             = var.project_name
  instance_type    = var.instance_type
  user_data_base64 = data.cloudinit_config.web.rendered
  ssh_cidr         = var.my_ip
  public_key_path  = var.public_key_path
}
