terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.6.2"
    }
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name                          = var.vpc_name
  cidr                          = var.vpc_cidr
  azs                           = var.vpc_azs
  public_subnets                = var.vpc_public_subnets
  manage_default_security_group = false
}

module "ec2_instances" {
  source                      = "./project-modules"
  count                       = 2
  instance_ami                = data.aws_ami.Amazon_Linux_2023_AMI.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.react_server_sg.id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.tf-key-pair.key_name

  tags = {
    Name        = "my-ec2-cluster-${count.index + 1}"
    Terraform   = "true"
    Environment = "dev"
  }
}
