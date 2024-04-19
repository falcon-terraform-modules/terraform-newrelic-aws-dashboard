variables {
  dashboard_name = "Example Production"
  dashboard_pages = {
    alb = {
      enabled = true
    }
    cloudfront = {
      enabled = true
    }
    ec2 = {
      enabled = true
    }
    ecs = {
      enabled = true
    }
    elasticache_redis = {
      enabled = true
    }
    lambda = {
      enabled             = true
      enhanced_monitoring = true
    }
    rds = {
      enabled             = true
      enhanced_monitoring = true
    }
    ses = {
      enabled = true
    }
  }
}

provider "newrelic" {
  account_id = var.newrelic_account_id
  api_key    = var.api_key
}

run "main" {
  command = apply
}