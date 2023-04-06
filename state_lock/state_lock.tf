resource "aws_instance" "state_lock_ec2" {
  ami           = "ami-00c39f71452c08778"
  instance_type = "t2.micro"
}