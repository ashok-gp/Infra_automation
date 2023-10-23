output "vpc_s3_bucket_arn" {
  description = "ARN of the created bucket"
  value       = aws_s3_bucket.vpclog.arn
}

output "alb_s3_bucket_arn" {
  description = "ARN of the created bucket"
  value       = aws_s3_bucket.alblog.arn
}