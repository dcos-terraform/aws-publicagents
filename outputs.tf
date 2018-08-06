output "instances" {
  description = "List of instances IDs created by this module"
  value       = ["${module.dcos-public-agent-instances.instances}"]
}

output "public_ips" {
  description = "List of public ip addresses created by this module"
  value       = ["${module.dcos-public-agent-instances.public_ips}"]
}

output "private_ips" {
  description = "List of private ip addresses created by this module"
  value       = ["${module.dcos-public-agent-instances.private_ips}"]
}

output "os_user" {
  description = "Output the OS user if default AMI is used"
  value       = "${module.dcos-tested-oses.user}"
}
