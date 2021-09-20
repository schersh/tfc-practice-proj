provider "aws" {
  region = var.region
}

resource "aws_instance" "app_server" {
  ami           = "ami-830c94e3"
  instance_type = var.instance_type

  tags = {
    Name = "ExampleTFCInstance"
  }
}
