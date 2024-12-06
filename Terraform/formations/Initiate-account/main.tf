#--------------------------------------------------------------------
# VPC - Creates a VPC  to the target account
#--------------------------------------------------------------------
module "vpc" {
  source = "git@github.com:njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/vpc?ref=v1.2"
  # for_each = var.vpc != null ? { for item in var.vpc : item.key => item } : {} 

  common = var.common
  vpc    = var.vpc
}

#--------------------------------------------------------------------
# Subnets - Creates private and public subnets
#--------------------------------------------------------------------
module "subnets" {
  source   = "git@github.com:njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/subnets?ref=v1.5"
  for_each = var.subnets != null ? { for item in var.subnets : item.key => item } : {}
  vpc_id   = module.vpc.vpc_id
  subnets  = var.subnets
  common   = var.common
}
