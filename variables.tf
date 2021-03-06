variable "type" {
  type        = string
  description = "(Required) Type of namespace"

  validation {
    condition     = contains(["http", "private_dns", "public_dns"], var.type)
    error_message = "The type must be one of http, private_dns, public_dns."
  }
}

variable "name" {
  type        = string
  description = "(Required) Namespace name"
}

variable "description" {
  type        = string
  description = "Namespace description"
  default     = ""
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
  description = "(Required if private DNS namespace) VPC ID of namespace"
  default     = ""
}

variable "tags" {
  type        = map(any)
  description = "Map of tags to apply to repository"
  default     = {}
}

variable "create_ssm_parameters" {
  type        = bool
  description = "Create SSM parameters with resource output values"
  default     = false
}

variable "ssm_parameter_prefix" {
  type        = string
  description = "Prefix for SSM parameters. Must start with /. If both stage and deployment are set, /stage/deployment will be used as prefix instead"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Extra information about stage of namespace, e.g. dev, tst, production"
  default     = ""
}

variable "deployment" {
  type        = string
  description = "Extra information about deployment of namespace in a stage, e.g. main, default, a, b, c"
  default     = ""
}