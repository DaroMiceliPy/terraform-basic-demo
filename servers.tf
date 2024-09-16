resource "aws_security_group" "server" {
  name = "mired-server"
  description = "Allow inbound traffic"
  vpc_id = aws_vpc.mired.id
  ingress {
    description = "ssh"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "mired-server" {
  ami = "ami-243434"
  instance_type = var.server_type
  subnet_id = aws_subnet.mired.id
  tags = {
    Name = "EC2-V1"
  }
}