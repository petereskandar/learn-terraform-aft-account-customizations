# output list of account_ids 

output "current_org" {
  value = data.aws_organizations_organization.current_org
}

output "account_info" {
  value = local.account_id
}


/*output "account_ids" {
  value = data.aws_organizations_organization.current_org.accounts[*].id
}*/