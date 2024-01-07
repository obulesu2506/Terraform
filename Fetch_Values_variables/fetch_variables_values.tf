provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIARSXQZD5EGNCVSPXD"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-0df7a207adb9748c7"
    instance_type = var.list[0]
	tags = {
      Name        = "IT from a variable"
	  #IT - Instance Type
    }
}

variable "list" {
	type = list
	default = ["m5.large","m5.xlarge","t2.medium"]

}

variable "types" {
	type = map
	default = {
		us-east-1 = "t2.micro"
		us-east-2 = "t2.nano"
		ap-south-1 = "t2.small"
		}

}