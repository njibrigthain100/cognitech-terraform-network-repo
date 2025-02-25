#--------------------------------------------------------------------
# VPC - Creates a VPC  to the target account
#--------------------------------------------------------------------
module "account_vpc" {
  source   = "../Create-Network"
  for_each = { for vpc in var.vpcs : vpc.name => vpc }
  vpc      = each.value
  common   = var.common
}
