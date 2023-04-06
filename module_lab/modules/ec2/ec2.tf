resource "aws_instance" "module_ec2_instance" {
  ami = "ami-00c39f71452c08778"
  instance_type = var.instance_type 
}