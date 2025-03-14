#--------------------------------------------------------------------
# VPC - Creates a VPC  to the target account
#--------------------------------------------------------------------
module "vpc" {
  source = "git::https://github.com/njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/vpc?ref=v1.35"
  vpc    = var.vpc
  common = var.common
}

#--------------------------------------------------------------------
# Subnets - Creates public subnets
#--------------------------------------------------------------------

module "public_subnets" {
  source         = "git::https://github.com/njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/subnets/public_subnets?ref=v1.35"
  vpc_id         = module.vpc.vpc_id
  public_subnets = var.vpc.public_subnets
  common         = var.common
}


module "public_route" {
  source = "git::https://github.com/njibrigthain100/Cognitech-terraform-iac-modules.git//terraform/modules/Routes/public_routes?ref=v1.35"
  vpc_id = module.vpc.vpc_id
  public_routes = {
    public_gateway_id      = module.vpc.igw_id
    destination_cidr_block = var.vpc.public_routes.destination_cidr_block
    primary_subnet_id      = module.public_subnets.primary_subnet_id
    secondary_subnet_id    = module.public_subnets.secondary_subnet_id
    tertiary_subnet_id     = module.public_subnets.tertiary_subnet_id
  }
  common = var.common
}







