
resource "aws_instance" "react_instance" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  tags                        = var.tags
  count                       = var.count_of_instances
  vpc_security_group_ids      = var.vpc_security_group_ids
  associate_public_ip_address = var.associate_public_ip_address


  root_block_device {
    delete_on_termination = true
    volume_size = 50
    volume_type = "gp2"
  }

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
}