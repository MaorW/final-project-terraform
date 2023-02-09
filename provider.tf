provider "aws" {
  profile = lookup(var.awsprops, "profile")
  region = lookup(var.awsprops, "region")

  default_tags {
    tags = {
      Name ="Red-Project-reactApp"
      Environment = "DEV"
      Managed = "Terraform"
   }
  }
}