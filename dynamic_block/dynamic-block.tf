provider "aws" {
  region     = "us-east-1"
}

variable "port_list" {
  type    = list(any)
  default = ["8000", "9000", "8888"]
}

resource "aws_security_group" "dynamic_block_sg" {
  name        = "dynamic_block_sg"
  description = "Dynamically ingess added for this sg"

  dynamic "ingress" {
    for_each = var.port_list
  #  iterator = port_value
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}