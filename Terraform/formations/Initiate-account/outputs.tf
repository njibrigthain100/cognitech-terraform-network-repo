output "vpc_id" {
  description = "The id of the vpc created"
  value       = module.vpc.vpc_id
}


output "igw_id" {
  description = "The internet gateway id"
  value       = module.vpc.igw_id
}

output "private_subnets" {
  description = "The private subnet outputs"
  value = var.private_subnets != null ? {
    for key, item in module.private_subnets :
    key => {
      private_subnet_ids                = item.private_subnet_ids
      private_subnet_cidr_blocks        = item.private_subnet_cidr_blocks
      private_subnet_arns               = item.private_subnet_arns
      private_subnet_availability_zones = item.private_subnet_availability_zones
    }
  } : null
}

output "public_subnets" {
  description = "The private subnet outputs"
  value = var.public_subnets != null ? {
    for key, item in module.public_subnets :
    key => {
      public_subnet_ids                = item.public_subnet_ids
      public_subnet_cidr_blocks        = item.public_subnet_cidr_blocks
      public_subnet_arns               = item.public_subnet_arns
      public_subnet_availability_zones = item.public_subnet_availability_zones
    }
  } : null
}

output "public_subnet_ids" {
  value = module.public_subnets.public_subnet_ids
}

output "eip_id" {
  description = "The elastic ip id"
  value = var.eip != null ? {
    for key, item in module.eip :
    key => {
      eip_id = item.eip_id
    }
  } : null
}
output "ngw_id" {
  description = "The id of the nat gateways"
  value = var.ngw != null ? {
    for key, item in module.ngw :
    key => {
      ngw_id = item.ngw_id
    }
  } : null
}
