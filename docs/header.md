# New Relic AWS Dashboard Terraform module
This Terraform module creates and configures NewRelic Dashboard for AWS.
It will create a separate page for each AWS service on a single Dashboard. It is possible to control create or not create pages for each AWS service. The source for the pages is JSON files published on [newrelic-quickstarts/dashboards](https://github.com/newrelic/newrelic-quickstarts/tree/main/dashboards).
New AWS services to be supported by update.