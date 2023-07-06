resource "aws_security_group" "react_server_sg" {
  name        = "react_server_sg"
  description = "Open ports 3000 and 22 for the react server"
  vpc_id      = module.vpc.vpc_id

  // Allow SSH Transport for the remote-exec provisioner
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // Allow Port 3000 port for react web interface
  ingress {
    from_port   = 3000
    protocol    = "tcp"
    to_port     = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}