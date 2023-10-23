resource "aws_s3_bucket" "vpclog" {
  bucket = var.vpc_bucket_name

  tags = {
       Terraform = "true"
  }
}

## Automatically delete old log files after expired 
resource "aws_s3_bucket_lifecycle_configuration" "vpclog_rule" {
  bucket = aws_s3_bucket.vpclog.id



  rule {
    id = "Delete old files"

     expiration {
      days = var.expire_days
    }

    status = "Enabled"
  }
}

resource "aws_s3_bucket" "alblog" {
  bucket = var.alb_bucket_name

  tags = {
       Terraform = "true"
  }
}


resource "aws_s3_bucket_lifecycle_configuration" "alblog_rule" {
  bucket = aws_s3_bucket.alblog.id



  rule {
    id = "Delete old files"

     expiration {
      days = var.expire_days1
    }

    status = "Enabled"
  }
}