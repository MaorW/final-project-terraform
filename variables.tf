variable "awsprops" {
    type = map(string)
    default = {
      region = "us-east-1" # You may change to your region ID
      profile = "default" # You may change your chosen IAM profile's name if you have more than one on your local host
      ami = "ami-0aa7d40eeae50c9a9"
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