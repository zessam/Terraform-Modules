data "aws_availability_zones" "azs" {}

locals {
  zones = slice(data.aws_availability_zones.azs.names, 0, var.vpc_zones)
}

module "vpc" {
  source  = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/2.0.0"

  namespace = var.namespace
  stage     = var.stage
  name      = var.name
  tags      = var.tags

  ipv4_primary_cidr_block = var.vpc_cidr

  

}

module "subnets" {
  source = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/2.0.0"

  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  tags       = var.tags

  vpc_id                             = module.vpc.vpc_id
  igw_id                             = module.vpc.igw_id
  availability_zones                 = local.zones
  availability_zone_attribute_style  = var.az_code

  nat_gateway_enabled                = true
  nat_instance_enabled               = false
}
