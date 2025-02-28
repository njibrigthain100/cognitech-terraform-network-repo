#--------------------------------------------------------------------
# VPC - Creates a VPC  to the target account
#--------------------------------------------------------------------
module "vpc" {
  source = "git@github.com:njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/vpc?ref=v1.18"
  vpc    = var.vpc
  common = var.common
}

#--------------------------------------------------------------------
# Subnets - Creates private subnets
#--------------------------------------------------------------------
module "private_subnets" {
  source          = "git@github.com:njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/subnets/private_subnets?ref=v1.18"
  for_each        = { for private_subnet in var.vpc.private_subnets : private_subnet.name => private_subnet }
  vpc_id          = module.vpc.vpc_id
  private_subnets = each.value
  common          = var.common
}

#--------------------------------------------------------------------
# Subnets - Creates public subnets
#--------------------------------------------------------------------

module "public_subnets" {
  source         = "git@github.com:njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/subnets/public_subnets?ref=v1.18"
  vpc_id         = module.vpc.vpc_id
  public_subnets = var.vpc.public_subnets
  common         = var.common
}

#--------------------------------------------------------------------
# Natgateway - Creates natgateways
#--------------------------------------------------------------------
module "ngw" {
  source = "git@github.com:njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/natgateway?ref=v1.18"
  bypass = (var.vpc.nat_gateway == null)
  common = var.common
  nat_gateway = {
    name                = var.vpc.nat_gateway != null ? var.vpc.nat_gateway.name : "unknown"
    subnet_id_primary   = module.public_subnets.primary_subnet_id
    subnet_id_secondary = module.public_subnets.secondary_subnet_id
    subnet_id_tertiary  = module.public_subnets.tertiary_subnet_id
    type                = var.vpc.nat_gateway != null ? var.vpc.nat_gateway.type : "unknown"
  }

}






