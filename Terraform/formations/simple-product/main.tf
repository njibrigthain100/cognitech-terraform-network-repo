#--------------------------------------------------------------------
# VPC - Creates a VPC  to the target account
#--------------------------------------------------------------------
module "product_vpc" {
  source   = "../Simple-network"
  for_each = { for vpc in var.vpcs : vpc.name => vpc }
  vpc      = each.value
  common   = var.common
}



