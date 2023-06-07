variable "stage" {
  type        = string
  description = "The stage of the deployment (dev, stg or prod)"

  validation {
    condition     = var.stage != null
    error_message = "The stage variable must be set."
  }

  validation {
    condition     = contains(["dev", "stg","prod"], var.stage)
     error_message = "Allowed values for stage are \"dev\", \"stg\" or \"prod\"."
  }
}

variable "region" {
  type        = string
  description = "The AWS region"
}