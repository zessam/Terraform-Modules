locals {
  zones = slice(data.aws_availability_zones.azs.names, 0, var.vpc_zones)
}
