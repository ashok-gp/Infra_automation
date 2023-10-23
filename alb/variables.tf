variable "name" {
  description = "Name of the ALB"
  type        = string
  default     = "my-alb" 
}

variable "vpc_id" {
  description = "ID of the VPC in which security resources are deployed"
  type = string
}

variable "internal" {
  description = "If true, the load balancer will be internal (not directly exposed to the internet)"
  type        = string
  default     = "false"
}

variable "lb_type" {
  description = "Type of load balancer"
  type        = string
  default     = "application"
}


variable "public_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

variable "instance_id1" {
  description = "The EC2 machine id"
  type        = string
}

variable "instance_id2" {
  description = "The EC2 machine id"
  type        = string
}

variable "log_destination" {
  description = "The EC2 machine id"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ARN of the certificate to use for the ALB. If empty, acm_certificate_domain must be set"
  type        = string
  default     = "arn:aws:acm:us-west-1:915862570768:certificate/ca44f30c-95fb-4a8a-9866-82ef58e74caf"
}
