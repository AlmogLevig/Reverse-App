resource "aws_security_group" "ins_sg" {
  name = var.sg_name
  description = "Custom security group for my cluster"

  ingress {
    description      = "ssh connection"
    from_port        = 30000
    to_port          = 32767
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "ssh connection"
    from_port        = 2379
    to_port          = 2380
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "ssh connection"
    from_port        = 10250
    to_port          = 10250
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "ssh connection"
    from_port        = 10259
    to_port          = 10259
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "ssh connection"
    from_port        = 10257
    to_port          = 10257
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  
  ingress {
    description      = "ssh connection"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }
    
  ingress {
    description      = "http connection"
    from_port        = 80
    to_port          = 80
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.sg_name
  }

}