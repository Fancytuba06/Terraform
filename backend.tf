#backend of s3 & tfstate

terraform {
  backend "s3" {
    bucket         = "plastic-bucket01"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
