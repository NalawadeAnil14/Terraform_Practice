provider "aws" {
  region     = "us-east-1"
}

variable "users" {
  type    = list(any)
  default = ["dev-user", "stage-user", "prod-user"]
}

resource "aws_iam_user" "user" {
  name  = var.users[count.index]
  count = 3
}