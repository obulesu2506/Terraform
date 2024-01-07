provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIARSXQZD5EGNCVSPXD"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-0df7a207adb9748c7"
    instance_type = "t2.micro"
	tags = {
      Name        = "Myfirst_ec2"
    }
}
