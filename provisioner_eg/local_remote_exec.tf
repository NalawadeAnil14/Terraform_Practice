resource "aws_instance" "terraform_first_instance" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
  key_name      = "terraform_key_pair"

  provisioner "local-exec" {
    command = "echo ${aws_instance.terraform_first_instance.private_ip} > private_ip.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y nginx",
      "sudo systemctl start nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C:\\Users\\AnilNalawade\\Desktop\\Terraform_practice\\terraform_key_pair.pem")
      host        = self.public_ip
    }
  }
}