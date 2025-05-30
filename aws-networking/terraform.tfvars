# Basic naming
namespace = "codeharbour"
stage     = "dev"
name      = "vpc"

# Tagging
tags = {
  "Project"     = "networking"
  "Environment" = "production"
  "Owner"       = "infra-team"
}

# VPC Configuration
vpc_cidr = "10.0.0.0/16"
vpc_zones = 3  # Number of Availability Zones to use
vpc_flow_logs_enabled = true # Enable VPC Flow Logs
# Security Group settings
enable_default_security_group_with_custom_rules = false

# Transit Gateway (optional)
#transit_gateway_id = "" # Put TGW ID here if needed, otherwise leave blank

# AZ Style: The style of Availability Zone code to use in tags and names. One of `full`, `short`, or `fixed`
az_code = "full"
