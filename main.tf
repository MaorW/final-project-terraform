terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.6.2"
    }
  }

  backend "s3" {
    bucket = var.bucket
    key    = var.bucket_folder
    region = var.region

    # Get status from Dynamodb state locking
    dynamodb_table = var.dynamodb_table
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
  source                      = "terraform-aws-modules/ec2-instance/aws"
  count                       = 2
  ami                         = data.aws_ami.Amazon_Linux_2023_AMI.id
  instance_type               = var.instance_type
  vpc_security_group_ids      = [aws_security_group.react_server_sg.id]
  subnet_id                   = module.vpc.public_subnets[0]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.tf-key-pair.key_name

  user_data = <<-EOF
    #!/bin/bash

    sudo yum update -y

    echo "Installing NodeJS"
    sudo yum install -y gcc-c++ make git
    curl -sL https://rpm.nodesource.com/setup_16.x | sudo -E bash -
    sudo yum install nodejs -y

    echo "Installing daemon process manager that will help manage and keep the reactApp online 24/7"
    sudo npm install pm2 -g

    echo "Clonning the React project and installing dependencies"
    git clone -b react-b https://github.com/hothaifa96/node-october.git
    cd node-october/counters-app
    npm i package.json

    echo "Excuteing the React project"
    pm2 --name reactApp start npm -- start
  EOF

  tags = {
    Name        = "my-ec2-cluster-${count.index + 1}"
    Terraform   = "true"
    Environment = "dev"
  }
}
