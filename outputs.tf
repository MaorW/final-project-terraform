output "reactApp_URLS" {
  description = "The url/s and the port number of the react app server/s."
  value       = module.ec2_instances[*].public_ip
}

output "Instructions" {
  description = "Instructions for serving the new instances"
  value       = "Take every IP and surf with 'http://<IP_ADDRESS>:3000'"
}