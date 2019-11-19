variable "name" {
  description = "Role Name"
}

variable "policies" {
  description = "polcies to attach"
  default     = []
}

variable "policy_count" {
  default     = 0
  description = "Number of policies passed"
}

variable "tags" {
  description = "Tags"
  default     = {}
}

