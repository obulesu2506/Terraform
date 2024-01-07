provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIARSXQZD5ECUDJFRNE"
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

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.lb.id
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