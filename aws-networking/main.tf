module "vpc" {
  source                           = "cloudposse/vpc/aws"
  version                          = "2.2.0"
  name                             = var.name
  namespace                        = var.namespace
  stage                            = var.stage
  tags                             = var.tags
  ipv4_primary_cidr_block          = var.ipv4_primary_cidr_block
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block


}

module "vpc-flow-logs-s3-bucket" {
  source             = "cloudposse/vpc-flow-logs-s3-bucket/aws"
  version            = "1.3.0"
  name               = "flowlogs"
  namespace          = var.namespace
  stage              = var.stage
  tags               = var.tags
  vpc_id             = module.vpc.vpc_id
  versioning_enabled = var.versioning_enabled
}

module "subnets" {
  source               = "cloudposse/dynamic-subnets/aws"
  version              = "2.4.2"
  namespace            = var.namespace
  stage                = var.stage
  name                 = var.name
  tags                 = var.tags
  vpc_id               = module.vpc.vpc_id
  igw_id               = module.vpc.igw_id
  ipv4_cidr_block      = module.vpc.vpc_cidr_block
  availability_zones   = local.zones
  nat_gateway_enabled  = true
  nat_instance_enabled = false

  availability_zone_attribute_style = var.az_code


}

resource "aws_ec2_transit_gateway_vpc_attachment" "default" {
  count = var.transit_gateway_id != "" ? 1 : 0

  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.subnets.private_subnet_ids
  transit_gateway_id = var.transit_gateway_id

  transit_gateway_default_route_table_association = true
  transit_gateway_default_route_table_propagation = true
}
