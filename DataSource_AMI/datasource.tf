provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAWMIP4LDNJF5UVENI"
  secret_key = "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"
}

data "aws_ami" "app_ami" {
	most_recent = true
	owners		= ["amazon"]
	
	filter {
		name 	= "name"
		values	= ["amzn2-ami-hvm*"]	
	}

}

resource "aws_instance" "app_dev" {
	ami				= 	data.aws_ami.app_ami.id
	instance_type 	=	"t2.micro"

}