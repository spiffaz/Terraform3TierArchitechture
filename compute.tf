resource "aws_launch_configuration" "mid_as_launch_conf" {
  #name = "middleware"
  image_id        = "ami-026b57f3c383c2eec"
  instance_type   = "t2.micro"
  key_name        = "CICD"
  security_groups = [aws_security_group.app-server-security-group.id]
  lifecycle {
    create_before_destroy = true
  }
  user_data = <<-EOF
    #!/bin/bash
    sudo su
    sudo yum update -y
    sudo yum install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo ' <html><body><h1> Check out my page for AWS 3 Tier Architecture </h1></body></html> ' >> /var/www/html/index.html
  EOF
}

resource "aws_autoscaling_group" "mid-asg" {
  #name = "middleware-asg"
  name_prefix          = "mid-asg"
  launch_configuration = aws_launch_configuration.mid_as_launch_conf.name
  max_size             = 6
  min_size             = 3
  vpc_zone_identifier  = [aws_subnet.app-subnet-1.id, aws_subnet.app-subnet-2.id, aws_subnet.app-subnet-3.id]
  target_group_arns    = [aws_lb_target_group.app_lb_tg.arn]
  health_check_type         = "ELB"
  tag {
    key                 = "role"
    value               = "app server"
    propagate_at_launch = true
  }
}

#middleware server
