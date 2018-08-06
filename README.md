AWS DC/OS Public Agent Instances
============
This module creates typical DC/OS public agent instancex

EXAMPLE
-------

```hcl
module "dcos-public-agent-instances" {
  source  = "terraform-dcos/private-agents/aws"
  version = "~> 0.1"

  cluster_name = "production"
  subnet_ids = ["subnet-12345678"]
  security_group_ids = ["sg-12345678"]"
  aws_key_name = "my-ssh-key"

  num_public_agents = "1"
}
```


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws_ami | Specify the AMI to be used. | string | `` | no |
| aws_associate_public_ip_address | The instance profile to be used for these instances | string | `true` | no |
| aws_iam_instance_profile | The instance profile to be used for these instances | string | `` | no |
| aws_instance_type | Specify the instance type | string | `t2.medium` | no |
| aws_key_name | The SSH key to use for these instances. | string | - | yes |
| aws_root_volume_size | Specify the root volume size | string | `120` | no |
| aws_root_volume_type | Specify the root volume type. | string | `standard` | no |
| aws_security_group_ids | Firewall IDs to use for these instances | list | - | yes |
| aws_subnet_ids | Subnets to spawn the instances in. The module tries to distribute the instances | list | - | yes |
| aws_user_data | The user data to be used on these instances. E.g. cloud init | string | `` | no |
| cluster_name | Specify the cluster name all resources get named and tagged with | string | - | yes |
| dcos_instance_os | The operating system to use. Instead of using your own AMI you could use a provided OS. | string | `centos_7.4` | no |
| hostname_format | Format the hostname inputs are index+1, region, cluster_name | string | `%[3]s-publicagent%[1]d-%[2]s` | no |
| num_public_agents | The Number of masters to spawn. This number should be odd. Typical options are (1,3,5,7,9) | string | `1` | no |
| tags | Add special tags to the resources created by this module | map | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| instances | List of instances IDs created by this module |
| os_user | Output the OS user if default AMI is used |
| private_ips | List of private ip addresses created by this module |
| public_ips | List of public ip addresses created by this module |

