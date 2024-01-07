provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIARSXQZD5EGNCVSPXD"
  secret_key = "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"
}
/*
resource "aws_instance" "myec2-1" {
    ami = "ami-0df7a207adb9748c7"
    instance_type = var.list[0]
	tags = {
      Name        = "IT from a variable"
	  #IT - Instance Type
    }
}

resource "aws_instance" "myec2-2" {
    ami = "ami-0df7a207adb9748c7"
    instance_type = var.list[0]
	tags = {
      Name        = "IT from a variable"
	  #IT - Instance Type
    }
}
Another method using count parameter
*/
resource "aws_instance" "myec2-1" {
    ami = "ami-0df7a207adb9748c7"
    instance_type = "t2.micro"
	tags = {
      Name        = "IT using count"
	  #IT - Instance Type
    }
	count = 3
}