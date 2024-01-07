provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAWMIP4LDNJF5UVENI"
  secret_key = "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"
}

variable "iam_names" {
	type 		= list
	default 	= ["Manager","worker1","worker2"]

}
/*
resource "aws_instance" "myec2-1" {
    ami = "ami-0df7a207adb9748c7"
    instance_type = "t2.micro"
	tags = {
      Name        = var.ec2_names[count.index]
	  #IT - Instance Type
    }
	count = 3
	
}
*/

resource "aws_iam_user" "lb" {
    name = var.iam_names[count.index]
	count = 3
	path = "/system/"
}