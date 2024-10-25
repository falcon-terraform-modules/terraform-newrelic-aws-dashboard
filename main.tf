locals {
  whare = length(var.aws_account_ids) == 0 ? "" : "WHERE aws.accountId IN (${join(",", formatlist("'%s'", var.aws_account_ids))})"
}

resource "newrelic_one_dashboard_json" "main" {
  json = templatefile("${path.module}/templates/dashboard.json.tftpl",
    {
      name        = var.dashboard_name
      description = var.dashboard_description
      permissions = var.dashboard_permissions
      pages = [
        for page in [
          # ALB
          var.dashboard_pages.alb.enabled ? templatefile("${path.module}/templates/pages/alb.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # APIGateway
          var.dashboard_pages.apig.enabled ? templatefile("${path.module}/templates/pages/api-gateway.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # Backup
          var.dashboard_pages.backup.enabled ? templatefile("${path.module}/templates/pages/backup.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # Bedrock
          var.dashboard_pages.apig.enabled ? templatefile("${path.module}/templates/pages/bedrock.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # CloudFront
          var.dashboard_pages.dynamodb.enabled ? templatefile("${path.module}/templates/pages/dynamodb.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # DynamoDB
          var.dashboard_pages.cloudfront.enabled ? templatefile("${path.module}/templates/pages/cloudfront.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # EC2
          var.dashboard_pages.ec2.enabled ? templatefile("${path.module}/templates/pages/ec2.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # ECS
          var.dashboard_pages.ecs.enabled ? templatefile("${path.module}/templates/pages/ecs.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # EFS
          var.dashboard_pages.efs.enabled ? templatefile("${path.module}/templates/pages/efs.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # ElastiCache Redis
          var.dashboard_pages.elasticache_redis.enabled ? templatefile("${path.module}/templates/pages/elasticache-redis.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null,
          # Lambda
          var.dashboard_pages.lambda.enabled ? templatefile("${path.module}/templates/pages/lambda.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare, enhanced_monitoring = var.dashboard_pages.lambda.enhanced_monitoring }) : null,
          # RDS
          var.dashboard_pages.rds.enabled ? templatefile("${path.module}/templates/pages/rds.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare, enhanced_monitoring = var.dashboard_pages.rds.enhanced_monitoring }) : null,
          # SQS
          var.dashboard_pages.sqs.enabled ? templatefile("${path.module}/templates/pages/sqs.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare, enhanced_monitoring = var.dashboard_pages.rds.enhanced_monitoring }) : null,
          # SES
          var.dashboard_pages.ses.enabled ? templatefile("${path.module}/templates/pages/ses.json.tftpl", { account_id = var.newrelic_account_id, where = local.whare }) : null
        ] : page if page != null
      ]
    }
  )
} 