variable "region" {
  description = "AWS region"
  default     = "us-west-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "bucket" {
  description: "S3 bucket"
  default: sm-test-tfc.link
}


variable "domain" {
 description: Domain name
 default: sm-test-tfc
}
