resource "aws_lb" "app_lb" {
  name               = "appLb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app_lb_sg.id]
  subnets            = [aws_subnet.app-subnet-1.id, aws_subnet.app-subnet-2.id, aws_subnet.app-subnet-3.id]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "app_lb_tg" {
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.tier-vpc.id
  name     = "appLbTg"
}

resource "aws_lb_listener" "app_lb" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_lb_tg.arn
  }
}