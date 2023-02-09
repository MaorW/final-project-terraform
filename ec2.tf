
resource "aws_instance" "react_instance" {
  ami = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "itype")
  subnet_id = lookup(var.awsprops, "subnet") #FFXsubnet2
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name = local_file.tf-key.filename


  vpc_security_group_ids = [
    aws_security_group.react_SG.id
  ]
  root_block_device {
    delete_on_termination = true
    volume_size = 50
    volume_type = "gp2"
  }
  tags = {
    Name ="ReactApp"
    Environment = "DEV"
    OS = "Amazon Linux 2"
    Managed = "Terraform"
  }
  depends_on = [ aws_security_group.react_SG ]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = self.public_ip
    private_key = file("${path.module}/${lookup(var.awsprops, "keyname")}")
  }

  provisioner "file" {
    source = "scripts/react-installation.sh"
    destination = "/home/ec2-user/react-installation.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ec2-user/react-installation.sh",
      "sudo /home/ec2-user/react-installation.sh",
    ]
  }
}

output "reactApp_URL" {
  value = "http://${aws_instance.react_instance.public_ip}:3000"
}