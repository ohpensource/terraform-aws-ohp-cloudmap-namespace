variable "namespace_type" {
  type = string
  description = "(Required) Type of namespace"

  validation {
    condition     = contains(["http", "private_dns", "public_dns"], var.namespace_type)
    error_message = "The namespace_type must be one of http, private_dns, public_dns."
  }
}

variable "name" {
  type        = string
  description = "Namespace name"
}

variable "description" {
  type        = string
  description = "Namespace description"
}

variable "allowed_read_only_account_ids" {
  type        = list(string)
  description = "List of account IDs that should be able to read from a cloudmap namespace"
  default     = []
}

variable "allowed_read_write_account_ids" {
  type        = list(string)
  description = "List of account IDs that should be able to update cloudmap namespace"
  default     = []
}

variable "create_iam_read_only_role" {
  type        = bool
  description = "Create namespace read-only role"
  default     = false
}

variable "create_iam_read_write_role" {
  type        = bool
  description = "Create namespace read-write role"
  default     = false
}

variable "vpc_id" {
  type        = string
  description = "VPC ID of namespace (necessary if private DNS namespace)"
  default     = ""
}

variable "tags" {
  type        = map(any)
  description = "(Required) Map of tags to apply to repository"
  default     = {}
}