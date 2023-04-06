resource "aws_instance" "terraform_first_instance" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro" 
}
