provider "aws" {
  profile = lookup(var.awsprops, "profile")
  region = lookup(var.awsprops, "region")
}