variable "awsprops" {
    type = map(string)
    default = {
      profile = "default"
      region = "us-east-1"
      vpc = "vpc-0bbbab9eac57c27fc"
      ami = "ami-0aa7d40eeae50c9a9"
      itype = "t2.micro"
      subnet = "subnet-01e0b38bdcc37bbd4"
      publicip = true
      keyname = "final-project-key"
      secgroupname = "react-Sec-Group"
  }
}