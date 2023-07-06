output "reactApp_URL" {
  description = "The url and the port number of the react app server."
  value       = module.ec2_instances[*].public_ip
}

