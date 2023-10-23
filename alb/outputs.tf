output "http_listener_arn" {
  description = "The HTTP ALB listener ARN"
  value       = module.alb.http_tcp_listener_arns
}

output "alb_sg_id" {
  description = "The ID of the ssecurity group1"
  value  =  aws_security_group.alb_sg.id
}


output "alb_hostname" {
  description = "The Load Balancer's AWS-provided host name"
  value       = module.alb.lb_dns_name
}

output "alb_arn" {
  description = "The Load Balancer's AWS-provided host name"
  value       = module.alb.lb_arn
}

output "sns_topic_arn" {
  description = "The Load Balancer's AWS-provided host name"
  value       = aws_sns_topic.notify_user.arn
}