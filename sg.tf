resource "aws_security_group" "app-server-security-group" {
  name = "app server security group"
  vpc_id = aws_vpc.tier-vpc.id
}

resource "aws_security_group_rule" "allow_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.app-server-security-group.id

  from_port   = 80
  to_port     = 80
  protocol    = "TCP"
  cidr_blocks = ["0.0.0.0/0"]
}

#resource "aws_security_group_rule" "allow_TLS_inbound" {
#  type              = "ingress"
#  security_group_id = aws_security_group.app-server-security-group.id
#  from_port   = 22
#  to_port     = 22
#  protocol    = "tcp"
#  cidr_blocks = ["0.0.0.0/0"]
#}

resource "aws_security_group_rule" "allow_all_app_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.app-server-security-group.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

}

#middleware
resource "aws_security_group" "mid-server-security-group" {
  name = "middleware server security group"
  vpc_id = aws_vpc.tier-vpc.id
}

resource "aws_security_group_rule" "allow_mid_http_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.mid-server-security-group.id

  from_port   = 0
  to_port     = 10000
  protocol    = "TCP"
  cidr_blocks = ["11.234.0.0/16"]
}

resource "aws_security_group_rule" "allow_mid_TLS_inbound" {
  type              = "ingress"
  security_group_id = aws_security_group.mid-server-security-group.id

  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group_rule" "allow_all_mid_outbound" {
  type              = "egress"
  security_group_id = aws_security_group.mid-server-security-group.id

  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_security_group" "app_lb_sg" {
  name   = "app_lb_sg"
  vpc_id = aws_vpc.tier-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["11.234.0.0/16"]
  }

}
