## Nested Inputs Reference
### dashboard_pages
- `alb`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `cloudfront`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `ecs`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `elasticache_redis`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `lambda`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
  - `enhanced_monitoring` - When this input is true, a page for Lambda Enhanced Monitoring will be created on the Dashboard. If [AWS Lambda Extensions Telemetry API](https://docs.newrelic.com/docs/infrastructure/amazon-integrations/aws-integrations-list/aws-lambda-telemetry/) is not integrated, a page will be created, but no data will be displayed.
- `rds`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
  - `enhanced_monitoring` - When this input is true, a page for RDS Enhanced Monitoring will be created on the Dashboard. If [Amazon RDS Enhanced Monitoring](https://docs.newrelic.com/docs/infrastructure/amazon-integrations/aws-integrations-list/aws-rds-enhanced-monitoring-integration/) is not integrated, a page will be created, but no data will be displayed.
- `ses`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.

## Usage
### 1. Configure NewRelic Provider
#### Example
##### provider.tf
```hcl
provider "newrelic" {
  account_id = "1234567"
  api_key    = "NRAK-XXXXXXXXXXXXXXXXXXXXXXXXX"
}
```
##### versions.tf
```hcl
terraform {
  required_version = ">= 1.7.0"
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = ">= 3.28.1"
    }
  }
}
```

### 2. Deploy module with refer to example usage