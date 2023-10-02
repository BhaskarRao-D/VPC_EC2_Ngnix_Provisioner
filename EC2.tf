resource "aws_instance" "ec2_instance" {

  ami                         = "ami-03c7c1f17ee073747"
  instance_type               = "t2.micro"
  key_name                    = "PG-Key"
  subnet_id                   = aws_subnet.publicsubnets.id
  vpc_security_group_ids      = [aws_security_group.sg.id]
  associate_public_ip_address = true

provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 777 /tmp/script.sh",
      "sudo /tmp/./script.sh",
    ]
  }

connection {
    type        = "ssh"
    user        = "ec2-user"
    port        = 22
    password    = "PG-Key.pem"
    private_key = file("/root/modules/vpc_ec2/PG-Key.pem")
    host        = aws_instance.ec2_instance.public_ip [or] self.public_ip
  }
}
