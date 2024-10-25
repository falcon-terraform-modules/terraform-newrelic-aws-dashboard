<!-- BEGIN_TF_DOCS -->
# New Relic AWS Dashboard Terraform module
This Terraform module creates and configures NewRelic Dashboard for AWS.
It will create a separate page for each AWS service on a single Dashboard. It is possible to control create or not create pages for each AWS service. The source for the pages is JSON files published on [newrelic-quickstarts/dashboards](https://github.com/newrelic/newrelic-quickstarts/tree/main/dashboards).
New AWS services to be supported by update.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_newrelic"></a> [newrelic](#requirement\_newrelic) | >= 3.28.1 |

## Resources

| Name | Type |
|------|------|
| [newrelic_one_dashboard_json.main](https://registry.terraform.io/providers/newrelic/newrelic/latest/docs/resources/one_dashboard_json) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_newrelic_account_id"></a> [newrelic\_account\_id](#input\_newrelic\_account\_id) | Specifies the New Relic account where the dashboard will be created. | `string` | n/a | yes |
| <a name="input_aws_account_ids"></a> [aws\_account\_ids](#input\_aws\_account\_ids) | Specifies AWS account IDs in a list. If not specified, the data from all AWS accounts integrated with the NewRelic account will be displayed on the Dashboard. | `list(string)` | `[]` | no |
| <a name="input_dashboard_name"></a> [dashboard\_name](#input\_dashboard\_name) | The name of the dashboard | `string` | n/a | yes |
| <a name="input_dashboard_description"></a> [dashboard\_description](#input\_dashboard\_description) | Brief text describing the dashboard | `string` | `""` | no |
| <a name="input_dashboard_permissions"></a> [dashboard\_permissions](#input\_dashboard\_permissions) | Determines who can see the dashboard in an account. Valid values are `PRIVATE`, `PUBLIC_READ_ONLY`, or `PUBLIC_READ_WRITE`. Defaults to `PUBLIC_READ_WRITE` | `string` | `"PUBLIC_READ_WRITE"` | no |
| <a name="input_dashboard_pages"></a> [dashboard\_pages](#input\_dashboard\_pages) | Specifies the parameters necessary to configure the page for each AWS service. Please set `enabled` to true for any one of the services. If `enabled` is set to false for all services, or if an empty object is configured, the apply will go through, but the creation of the Dashboard will fail. See `Nested Inputs Reference` for details. | `object` | n/a | yes |

## Outputs

No outputs.

## Nested Inputs Reference
### dashboard\_pages
- `alb`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `apig`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `backup`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `bedrock`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `cloudfront`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `daynamodb`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `ec2`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `ecs`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `efs`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `elasticache_redis`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `lambda`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
  - `enhanced_monitoring` - When this input is true, a page for Lambda Enhanced Monitoring will be created on the Dashboard. If [AWS Lambda Extensions Telemetry API](https://docs.newrelic.com/docs/infrastructure/amazon-integrations/aws-integrations-list/aws-lambda-telemetry/) is not integrated, a page will be created, but no data will be displayed.
- `rds`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
  - `enhanced_monitoring` - When this input is true, a page for RDS Enhanced Monitoring will be created on the Dashboard. If [Amazon RDS Enhanced Monitoring](https://docs.newrelic.com/docs/infrastructure/amazon-integrations/aws-integrations-list/aws-rds-enhanced-monitoring-integration/) is not integrated, a page will be created, but no data will be displayed.
- `sqs`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.
- `ses`
  - `enabled` - Specify the enable/disable of the page using a boolean. The default value is `false`.

## Usage
### 1. Configure NewRelic Provider
#### Example
##### providers.tf
```hcl
provider "newrelic" {
  account_id = "1234567"
  api_key    = "NRAK-XXXXXXXXXXXXXXXXXXXXXXXXX"
}
```
##### terraform.tf
```hcl
terraform {
  required_providers {
    newrelic = {
      source  = "newrelic/newrelic"
      version = ">= 3.28.1"
    }
  }
}
```

### 2. Deploy module with refer to example usage
## Example Usage
```hcl
module "aws-dashboard" {
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
    backup = {
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
    efs = {
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
    sqs = {
      enabled = true
    }
  }
}
```
<!-- END_TF_DOCS -->