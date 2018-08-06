/**
 * AWS DC/OS Public Agent Instances
 * ============
 * This module creates typical DC/OS public agent instancex
 *
 * EXAMPLE
 * -------
 *
 *```hcl
 * module "dcos-public-agent-instances" {
 *   source  = "terraform-dcos/private-agents/aws"
 *   version = "~> 0.1"
 *
 *   cluster_name = "production"
 *   subnet_ids = ["subnet-12345678"]
 *   security_group_ids = ["sg-12345678"]"
 *   aws_key_name = "my-ssh-key"
 *
 *   num_public_agents = "1"
 * }
 *```
 */

provider "aws" {}

module "dcos-tested-oses" {
  source  = "dcos-terraform/tested-oses/aws"
  version = "~> 0.0"

  providers = {
    aws = "aws"
  }

  os = "${var.dcos_instance_os}"
}

// Instances is spawning the VMs to be used with DC/OS (bootstrap)
module "dcos-public-agent-instances" {
  source  = "dcos-terraform/instance/aws"
  version = "~> 0.0"

  providers = {
    aws = "aws"
  }

  cluster_name       = "${var.cluster_name}"
  hostname_format    = "${var.hostname_format}"
  num                = "${var.num_public_agents}"
  ami                = "${coalesce(var.aws_ami,module.dcos-tested-oses.aws_ami)}"
  user_data          = "${var.aws_ami == "" ? module.dcos-tested-oses.os-setup : var.aws_user_data}"
  instance_type      = "${var.aws_instance_type}"
  subnet_ids         = ["${var.aws_subnet_ids}"]
  security_group_ids = ["${var.aws_security_group_ids}"]
  key_name           = "${var.aws_key_name}"
  root_volume_size   = "${var.aws_root_volume_size}"
  root_volume_type   = "${var.aws_root_volume_type}"
  tags               = "${var.tags}"
}
