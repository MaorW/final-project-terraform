##### VPC Variables ############

variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "final-project-terraform"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["eu-west-1a"]
}


variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.1.1.0/24"]
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Name        = "final-project-terraform"
    Terraform   = "true"
    Environment = "dev"
  }
}

##### EC2 Variables ############333

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

data "aws_ami" "Amazon_Linux_2023_AMI" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.1.20230629.0-kernel-6.1-x86_64"]
  }
}

##### key_name Variables ############
variable "key_name" {
  description = "Private Key Name"
  type        = string
  default     = "final-project-key"
}