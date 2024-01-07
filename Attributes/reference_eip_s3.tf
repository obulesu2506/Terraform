provider "aws" {
  region     = "ap-southeast-1"
  access_key = "AKIARSXQZD5EGNCVSPXD"
  secret_key = "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"
}

resource "aws_instance" "myec2" {
    ami = "ami-0b08bfc6ff7069aff"
    instance_type = "t2.micro"
	tags = {
      Name        = "Myfirst_ec2"
    }
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


resource "aws_security_group" "allow_tls" {
  name        = "kplabs-security-group"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["${aws_eip.lb.public_ip}/32"]

#    cidr_blocks = [aws_eip.lb.public_ip/32]
  }
}