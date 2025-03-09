resource "aws_s3_bucket" "tfstate" {
  bucket = "tfstate-spot-sentry"
}

resource "aws_s3_bucket_versioning" "main" {
  bucket = aws_s3_bucket.tfstate.id
  versioning_configuration {
    status = "Enabled"
  }
}