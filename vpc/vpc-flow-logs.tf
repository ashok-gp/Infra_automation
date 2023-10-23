## Create VPC flow logs based on variable(aws_flow_log) which varies based on different environment

resource "aws_flow_log" "flow_logs" {
  count = var.enable_flow_logs == true ? 1 : 0
  log_destination      = var.s3_bucket_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = module.vpc.vpc_id
}