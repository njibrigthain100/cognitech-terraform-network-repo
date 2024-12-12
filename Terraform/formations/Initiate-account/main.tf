#--------------------------------------------------------------------
# VPC - Creates a VPC  to the target account
#--------------------------------------------------------------------
module "vpc" {
  source = "git@github.com:njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/vpc?ref=v1.12"
  # for_each = var.vpc != null ? { for item in var.vpc : item.key => item } : {} 

  common = var.common
  vpc    = var.vpc
}

#--------------------------------------------------------------------
# Subnets - Creates private subnets
#--------------------------------------------------------------------
module "private_subnets" {
  source          = "git@github.com:njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/subnets/private_subnets?ref=v1.16"
  for_each        = var.private_subnets != null ? { for item in var.private_subnets : item.private_subnet_name => item } : {}
  vpc_id          = module.vpc.vpc_id
  private_subnets = each.value
  common          = var.common
}

#--------------------------------------------------------------------
# Subnets - Creates public subnets
#--------------------------------------------------------------------
module "public_subnets" {
  source         = "git@github.com:njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/subnets/public_subnets?ref=v1.16"
  for_each       = var.public_subnets != null ? { for item in var.public_subnets : item.public_subnet_name => item } : {}
  vpc_id         = module.vpc.vpc_id
  public_subnets = each.value
  common         = var.common
}
