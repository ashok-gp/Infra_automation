## Using VPC modules from terraform registry for quickly deploying common infrastructure configurations 
module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets_cidr_blocks
  public_subnets  = var.public_subnets_cidr_blocks

  enable_nat_gateway = var.enable_nat_gateway
  single_nat_gateway  = var.single_nat_gateway
  map_public_ip_on_launch = true
  tags = {
    Terraform = "true"
  }
}
