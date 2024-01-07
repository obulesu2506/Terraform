provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIARSXQZD5EGNCVSPXD"
  secret_key = "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"
}

resource "aws_eip" "lb" {
  vpc      = true
  tags = {
      Name        = "Myfirst_EIP"
    }
}

output "eip" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "mys3" {
  bucket = "attribute-demo-hashi-120523"
  tags = {
      Name        = "Myfirst_S3B"
    }
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3
}
