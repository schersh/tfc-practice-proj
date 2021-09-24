provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket
  acl    = "public-read"
  policy =   jsonencode({
      Version = "2012-10-17"
      Id      = "MYBUCKETPOLICY"
      Statement = [
        {
          Sid       = "AddPerm"
          Effect    = "Allow"
          Principal = "*"
          "Action":[
           "s3:GetObject"
          ],
          "Resource":[
           "arn:aws:s3:::sm-test-tfc.link/*"
          ]
        },
      ]
    })

    website {
      index_document = "index.html"
      error_document = "error.html"
    }
  }

resource "aws_s3_bucket_object" "index" {
  bucket = var.bucket
  key    = "index.html"
  source = "index.html"

}

resource "aws_s3_bucket_object" "error" {
  bucket = var.bucket
  key    = "error.html"
  source = "error.html"

}

resource "aws_route53_zone" "primary" {
  name = "sm-test-tfc.link"
}

resource "aws_route53_record" "www" {
  zone_id = resource.aws_route53_zone.primary.zone_id
  name    = "sm-test-tfc.link"
  type    = "A"
  alias {
    name                   = resource.aws_s3_bucket.b.website_endpoint
    zone_id                = resource.aws_s3_bucket.b.hosted_zone_id
    evaluate_target_health = false
  }
}
