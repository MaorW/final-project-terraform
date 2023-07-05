variable "awsprops" {
    type = map(string)
    default = {
      region = "us-east-1" # You may change to your region ID
      profile = "default" # You may change your chosen IAM profile's name if you have more than one on your local host
      itype = "t2.micro"
      keyname = "final-project-key"
      secgroupname = "react-Sec-Group"
  }
}

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}
variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
}

data "aws_ami" "Amazon_Linux_2023_AMI" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.1.20230629.0-kernel-6.1-x86_64"]
  }
}