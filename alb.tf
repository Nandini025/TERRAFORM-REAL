resource "aws_lb" "alb" {
  name               = "LoadBalancer"
  internal           = var.ALB
  load_balancer_type = var.Load-type
  security_groups    = var.security-group
  subnets            = var.Subnet-List

  enable_deletion_protection = true

 // access_logs {
  //  bucket  = aws_s3_bucket.my bucket.id
   // prefix  = "test-lb"
   // enabled = true
 // }

  tags = {
    Environment = "production"
  }
}