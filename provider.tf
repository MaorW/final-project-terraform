provider "aws" {
  region = "eu-west-1" # You may change to your region ID

  default_tags {
    tags = {
      Name        = "final-project-terraform"
      Terraform   = "true"
      Environment = "dev"
    }
  }
}