provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "object" {
  bucket = "var.bucket"
  key    = "index_file"
  source = "/index.html"

}

resource "aws_s3_bucket_object" "object" {
  bucket = "var.bucket"
  key    = "error_file"
  source = "/error.html"

}
