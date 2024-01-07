provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIAWMIP4LDNJF5UVENI"
  secret_key = "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"
}

locals {
	common_tags = {
		owner = "Devops team"
		service = "backend"
	}
}


resource "aws_instance" "app-dev" {
	ami = "ami-0b1217c6bff20e276"
	instance_type = "t2.micro"
	tags = local.common_tags

}

resource "aws_ebs_volume" "db-ebs" {
	availability_zone = "ap-southeast-1"
	size = 8
	tags = local.common_tags

}