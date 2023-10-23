variable "vpc_id" {
  description = "ID of the VPC in which security resources are deployed"
  type = string
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
}

variable "instance_size" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "t2.micro"
}

variable "ebs_encryption" {
  description = "To manage the default KMS key for the region"
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "The ID of the ssecurity group1"
  type = string
}
