variable "namespace" {
  description = "Namespace (e.g. `codeharbour`)"
  type        = string
}

variable "stage" {
  description = "Stage (e.g. `prod`, `dev`, `staging`)"
  type        = string
}

variable "name" {
  description = "Solution name (e.g. `app`)"
  type        = string
  default     = "vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}



variable "vpc_flow_logs_enabled" {
  description = "Option whether to enable vpc flow logs"
  type        = bool
  default     = false
}

variable "vpc_flow_logs_interval" {
  description = "Interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid values: `60` or `600`"
  type        = number
  default     = 600
}

variable "vpc_zones" {
  description = "Number of availability zones"
  type        = number
  default     = 3
}

variable "transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
  type        = map(string)
  default     = {}
}

variable "az_code" {
  description = "The style of Availability Zone code to use in tags and names. One of `full`, `short`, or `fixed`"
  type        = string
  default     = "full"
}


variable "enable_default_security_group_with_custom_rules" {
  description = "Whether to enable default security group with custom rules"
  type        = bool
  default     = false
}
