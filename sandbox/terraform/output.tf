# output list of account_ids 
output "account_ids" {
  value = data.aws_organizations_organization.current_org.accounts[*].id
}