output "public_ip" {
  description   = "The public IP address assigned to the instance, if applicable."
  value         = aws_instance.react_instance[*].public_ip
}