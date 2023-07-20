provider "aws" {
  region = "eu-west-1"

  default_tags {
    tags = {
      Name        = "final-project-terraform"
      Terraform   = "true"
      Environment = "dev"
    }
  }
}