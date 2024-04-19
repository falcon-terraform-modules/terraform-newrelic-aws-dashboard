module "dashboard" {
  source = "falcon-terraform-modules/aws-dashboard/newrelic"

  aws_account_ids     = ["1234567891011"]
  newrelic_account_id = "1234567"
  dashboard_name      = "Example Production"
  dashboard_pages = {
    alb = {
      enabled = true
    }
    apig = {
      enabled = true
    }
    bedrock = {
      enabled = true
    }
    cloudfront = {
      enabled = true
    }
    dynamodb = {
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