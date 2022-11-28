# output list of account_ids 

output "current_org" {
  value = data.aws_organizations_organization.current_org
}

output "account_info" {
  value = data.aws_caller_identity.current
}


/*output "account_ids" {
  value = data.aws_organizations_organization.current_org.accounts[*].id
}*/