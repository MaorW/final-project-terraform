provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Name        = "final-project-terraform"
      Terraform   = "true"
      Environment = "dev"
    }
  }
}