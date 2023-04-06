terraform {
  backend "s3" {
    bucket = "terraformstatelockbackend"
    key    = "terraform.tfstate1"
    region = "us-east-1"
  }
}