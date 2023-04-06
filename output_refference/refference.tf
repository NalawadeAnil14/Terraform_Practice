provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "terraform_output_reference_instance" {
  ami = "ami-00c39f71452c08778"
  instance_type = "t2.micro" 
}

resource "aws_eip" "lb" {
  vpc = true
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.terraform_output_reference_instance.id
  allocation_id = aws_eip.lb.id
}