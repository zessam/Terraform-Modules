variable "name" {
  description = "The name of the repository"
}

variable "image_tag_mutability" {
  description = "Tag mutability setting for the repository, values can be either `MUTABLE` or `IMMUTABLE`"
  default     = "MUTABLE"
}

variable "image_scanning_enabled" {
  description = "Option whether to enable image scanning on push"
  type        = bool
  default     = true
}

variable "tags" {
  description = "List of maps of tags to add"
  type        = map(string)
  default     = {}
}