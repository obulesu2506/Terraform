provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIARSXQZD5EGNCVSPXD"
  secret_key = "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"
}

resource "aws_iam_user" "lb" {
    name = "loadbalancer.${count.index}"
	count = 5
	path = "/system/"
}