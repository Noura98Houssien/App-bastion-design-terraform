resource "aws_security_group" "allow_ssh_from_any_ip" {
  name        = "allow_ssh_from_any_ip"
  description = "allow_ssh_from_any_ip"
  vpc_id      = aws_vpc.iti.id

  ingress {
    description = "allow_ssh_from_any_ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_from_any_ip"
  }
}

resource "aws_security_group" "allow_ssh_from_vpc_cidr" {
  name        = "allow_ssh_from_vpc_cidr"
  description = "allow_ssh_from_vpc_cidr"
  vpc_id      = aws_vpc.iti.id

  ingress {
    description = "allow_ssh_from_vpc_cidr_port22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.iti.cidr_block]
  }
  ingress {
    description = "allow_ssh_from_vpc_cidr_port3000"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.iti.cidr_block]
  }
  

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_ssh_from_vpc_cidr"
  }
}