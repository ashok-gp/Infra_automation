## Declaring AWS provider configuration with version constraints
provider "aws" {
  region = "us-west-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.17"
    }
  }

backend "s3" {
    bucket         	   = "persol-terraform-tfstate"
    key              	   = "state/terraform.tfstate"
    region         	   = "us-west-1"
    encrypt        	   = true
    dynamodb_table     = "locktable"
  }
}

## Taking multiple composable building-block modules and assembles them together to produce a larger system know as module composition
## s3 module
module "s3-mod" {
   source = ".//s3"
}

## vpc module reference outputs of s3 module
module "vpc-mod" {
   source = ".//vpc"
   s3_bucket_arn = module.s3-mod.vpc_s3_bucket_arn
}

## ec2 module reference outputs of ALB and VPC module
module "ec2-mod" {
   source = ".//ec2"
   vpc_id = module.vpc-mod.vpc_id
   security_group_id = module.alb-mod.alb_sg_id
   private_subnets = module.vpc-mod.private_subnets
}

## ALB module reference outputs of VPC and EC2 module
module "alb-mod" {
   source = ".//alb"
   vpc_id = module.vpc-mod.vpc_id
   public_subnets = module.vpc-mod.public_subnets
   log_destination  = module.s3-mod.alb_s3_bucket_arn
   instance_id1  = module.ec2-mod.instance_id1
   instance_id2  = module.ec2-mod.instance_id2
}
