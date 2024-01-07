provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAWMIP4LDNJF5UVENI"
  secret_key = "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"
}

variable "istest" {}

resource "aws_instance" "Dev" {
	ami = "ami-0b1217c6bff20e276"
	instance_type = "t2.micro"
	tags = {
		name = "dev"
	}
	count = var.istest == true ? 3 : 0
}
resource "aws_instance" "PROD" {
	ami = "ami-0b1217c6bff20e276"
	instance_type = "t1.micro"
	tags = {
		name = "PROD"
	}
	count = var.istest == false ? 3 : 0
}