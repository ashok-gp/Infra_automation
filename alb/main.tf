## Using ALB modules from terraform registry for quickly deploying common infrastructure configurations 
module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 8.0"

  name = var.name
  internal  = var.internal
  load_balancer_type = var.lb_type

  vpc_id             = var.vpc_id

  ## With multiple Availability Zones, we designed and operate applications 
  ## that automatically fail over between zones without interruption
  subnets            = [ var.public_subnets[0], 
                        var.public_subnets[1]
                        ]
  security_groups    = [aws_security_group.alb_sg.id]

##  access_logs = {
##    bucket = var.log_destination
##  }

##Application Load Balancers to distribute incoming traffic across multiple targets
  target_groups = [
    {
      backend_protocol = "HTTP"
      backend_port     = 80
      target_type      = "instance"
      targets = {
        target1 = {
          target_id = var.instance_id1
          port = 80
        }
        target2 = {
          target_id = var.instance_id2
          port = 80
        }
      }
    }
  ]
  
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      target_group_index = 0
    }
  ]

##  https_listeners = [
##   {
##      port               = 443
##      protocol           = "HTTPS"
##      certificate_arn    = var.acm_certificate_arn
##      target_group_index = 0
##   }
##  ]

  tags = {
        Terraform = "true"
  }
}
