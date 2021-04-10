
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "application" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids= [aws_security_group.allow_ssh_from_vpc_cidr.id]
  subnet_id=aws_subnet.private1.id 
  key_name = aws_key_pair.deployer.key_name
  tags = {
    Name = "app"
  }
}