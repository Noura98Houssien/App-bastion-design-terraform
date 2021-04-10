

resource "aws_instance" "bastion" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  vpc_security_group_ids= [aws_security_group.allow_ssh_from_any_ip.id]
  subnet_id=aws_subnet.public1.id 
  tags = {
    Name = "bastion"
  }
  key_name = aws_key_pair.deployer.key_name
   provisioner "file" {
    source      = "./config"
    destination = "~/config"
  }
#   provisioner "remote-exec" {
#       inline = [
#       "mkdir ~/.ssh",
#       "echo ${key_name} > authorized_keys"
#     ]
#   }
  provisioner "remote-exec" {
      inline = [
      "mkdir ~/.ssh",
      "echo ~/.ssh/id_rsa > ~/.ssh/id_rsa"
    ]
  }
  provisioner "remote-exec" {
  connection {
    type = "ssh"
    user = "ubuntu"
    host = "${aws_instance.bastion.public_ip}"
    private_key = "${file("~/.ssh/id_rsa")}"
    agent = false
    timeout = "2m"
  }

    inline = [
      "ls",
    ]
  }

}


