variable "awsprops" {
    type = map(string)
    default = {
      profile = "learning"
      region = "us-east-1" # You should change to your region ID
      /* vpc = "vpc-0bbbab9eac57c27fc" # You should change to your VPC ID */
      ami = "ami-0aa7d40eeae50c9a9"
      itype = "t2.micro"
      /* subnet = "subnet-01e0b38bdcc37bbd4" # You should change to your subnet ID */
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