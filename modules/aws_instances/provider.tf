provider "aws" {
  region     = "us-east-1"
  profile    = "default"
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
}