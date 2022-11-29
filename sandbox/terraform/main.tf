data "aws_organizations_organization" "current_org" {}

// try external data source to get list-accounts-for-parent CLI command
data "external" "accounts" {
  #provider = aws.master-account
  program = ["aws", "organizations", "list-accounts-for-parent", "--parent-id", local.ou, "--profile aft-management-admin", "--query", "Accounts[?Name==`${local.account_name}`] | [0]"]
}

locals {
   ou           = "ou-kfmq-hs0h7yjq"
   account_name = "demo-poste"
   account_id   = lookup(data.external.accounts.result, "Id", null)
}
// try external data source to get list-accounts-for-parent CLI command

resource "aws_budgets_budget" "total_cost" {
  name              = "budget-total-monthly-atf"
  budget_type       = "COST"
  limit_amount      = "100"
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2022-02-01_00:00"
  time_unit         = "MONTHLY"
}