variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "count_of_instances"{
  description = "Number of instances"
  type = number
  default = 1
}

variable "vpc_security_group_ids" {
  description = "List of security group IDs"
  type = list(string)
}

variable "tags" {
  description = "Additional tags for the instance"
  type = map(string)
}

variable "associate_public_ip_address" {
  description = "Public IP association"
  type = bool
}

variable "instance_ami" {
  description = "The latest Amazon Linux 2023 ami"
  type = string
}

variable "key_name" {
  description = "Private Key Name"
  type = string  
}