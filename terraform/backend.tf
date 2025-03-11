resource "aws_s3_bucket" "tfstate" {
  bucket = "tfstate-spot-sentry"
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}

terraform {
  backend "s3" {
    bucket = "tfstate-spot-sentry"
    key    = "terraform/terraform.tfstate"
    region = "ap-northeast-2"
  }
}