variable "vpc_bucket_name" {
  description = "Name of the bucket"
  type        = string
  default     = "vpc-flow-logs-persol"
}

variable "expire_days" {
  description = "Number of days for which files in the bucket are kept"
  type        = number
  default     = 90
}

variable "alb_bucket_name" {
  description = "Name of the bucket"
  type        = string
  default     = "alb-flow-logs-persol"
}

variable "expire_days1" {
  description = "Number of days for which files in the bucket are kept"
  type        = number
  default     = 180
}