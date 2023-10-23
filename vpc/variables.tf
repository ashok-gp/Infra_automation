variable "vpc_name" {
  description = "Name of VPC to be used on all the resources as identifier"
  type        = string
  default     = "my-vpc"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = list(string)
  default     = ["us-west-1a", "us-west-1b", "us-west-1c"]
}

variable "public_subnets_cidr_blocks" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["192.168.1.0/24", "192.168.2.0/24"]
}

variable "private_subnets_cidr_blocks" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["192.168.101.0/24", "192.168.102.0/24"]
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  type        = bool
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = true
}

variable "enable_flow_logs" {
  description = "Enable flow logs for attached vpcs, sent to s3 bucket"
  type        = bool
  default     = true
}

variable "s3_bucket_arn" {
  description = "The arn of the s3 bucket"
  type = string
}