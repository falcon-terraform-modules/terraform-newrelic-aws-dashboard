variable "aws_account_ids" {
  description = "Specifies AWS account IDs in a list. If not specified, the data from all AWS accounts integrated with the NewRelic account will be displayed on the Dashboard."
  type        = list(string)
  default     = []
}

variable "newrelic_account_id" {
  description = "Specifies the New Relic account where the dashboard will be created."
  type        = string
}

variable "dashboard_name" {
  description = "The name of the dashboard"
  type        = string
}

variable "dashboard_description" {
  description = "Brief text describing the dashboard"
  type        = string
  default     = ""
}

variable "dashboard_permissions" {
  description = "Determines who can see the dashboard in an account. Valid values are `PRIVATE`, `PUBLIC_READ_ONLY`, or `PUBLIC_READ_WRITE`. Defaults to `PUBLIC_READ_WRITE`"
  type        = string
  default     = "PUBLIC_READ_WRITE"
}

variable "dashboard_pages" {
  description = "Specifies the parameters necessary to configure the page for each AWS service. Please set `enabled` to true for any one of the services. If `enabled` is set to false for all services, or if an empty object is configured, the apply will go through, but the creation of the Dashboard will fail. See [Nested Inputs Reference](https://github.com/falcon-terraform-modules/terraform-newrelic-aws-dashboard?tab=readme-ov-file#dashboard_pages) for details."
  type = object({
    alb = optional(object({
      enabled = optional(bool, false)
    }), { enabled = false })
    cloudfront = optional(object({
      enabled = optional(bool, false)
    }), { enabled = false })
    ec2 = optional(object({
      enabled = optional(bool, false)
    }), { enabled = false })
    ecs = optional(object({
      enabled = optional(bool, false)
    }), { enabled = false })
    elasticache_redis = optional(object({
      enabled = optional(bool, false)
    }), { enabled = false })
    lambda = optional(object({
      enabled             = optional(bool, false)
      enhanced_monitoring = optional(bool, false)
    }), { enabled = false })
    rds = optional(object({
      enabled             = optional(bool, false)
      enhanced_monitoring = optional(bool, false)
    }), { enabled = false })
    ses = optional(object({
      enabled = optional(bool, false)
    }), { enabled = false })
  })
}