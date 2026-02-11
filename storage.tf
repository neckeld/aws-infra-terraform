resource "aws_s3_bucket" "meu_primeiro_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = "S3-Daniel"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "upload_test" {
  bucket       = aws_s3_bucket.meu_primeiro_bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
}