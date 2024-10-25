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


variable "transit_gateway_id" {
  description = "Identifier of EC2 Transit Gateway"
  type        = string
  default     = ""
}


variable "vpc_zones" {
  description = "Number of availability zones"
  type        = number
  default     = 3
}


variable "az_code" {
  description = "The style of Availability Zone code to use in tags and names. One of `full`, `short`, or `fixed`"
  type        = string
  default     = "full"
}


variable "assign_generated_ipv6_cidr_block" {
  description = "Boolean variable to enable or disable assigning ipv6 cidrblock"
  type        = bool
  default     = false
}


variable "versioning_enabled" {
  description = "Boolean variable to enable or disable versioning in s3 bucket"
  type        = bool
  default     = true
}

variable "tags" {
  description = "Additional tags (e.g. `map('BusinessUnit`,`XYZ`)"
  type        = map(string)
  default     = {}
}
