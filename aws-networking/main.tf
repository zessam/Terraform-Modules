data "aws_availability_zones" "azs" {}

locals {
  zones             = slice(data.aws_availability_zones.azs.names, 0, var.vpc_zones)
}


module "vpc" {
    source     = "git::https://github.com/cloudposse/terraform-aws-vpc.git?ref=tags/0.27.0"
    namespace = var.namespace
    stage     = var.stage
    name      = var.name
    tags      = var.tags
    vpc_cidr_block = var.vpc_cidr


    enable_default_security_group_with_custom_rules = var.enable_default_security_group_with_custom_rules
}


module "subnets" {
    source               = "git::https://github.com/cloudposse/terraform-aws-dynamic-subnets.git?ref=tags/0.39.5"
    namespace            = var.namespace
    stage                = var.stage
    name                 = var.name
    tags                 = var.tags
    vpc_id               = module.vpc.vpc_id
    availability_zones   = local.zones
    nat_gateway_enabled = true
    nat_instance_enabled = false

    availability_zone_attribute_style = var.az_code
}

