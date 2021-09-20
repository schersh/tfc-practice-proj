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

resource "aws_route53_zone" "domain" {
  name = var.link
}

resource "aws_route53_key_signing_key" "domain" {
  hosted_zone_id             = aws_route53_zone.var.domain.id
  key_management_service_arn = aws_kms_key.var.domain.arn
  name                       = var.link
}
