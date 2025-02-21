output "vpc_id" {
  description = "The id of the vpc created"
  value       = module.vpc.vpc_id
}


output "igw_id" {
  description = "The internet gateway id"
  value       = module.vpc.igw_id
}
#-------------------------------------------------------
# Private subnet outputs
#-------------------------------------------------------
output "private_subnet" {
  description = "Output of all private subnets"
  value       = values(module.private_subnets)
}
output "private_subnet" {
  description = "The private subnet resources"
  value = var.vpc != null ? {
    for key, item in var.vpc.private_subnets :
    item.name => module.private_subnets[item.name]
  } : null
}

#-------------------------------------------------------
# Public subnet outputs
#-------------------------------------------------------
output "public_subnet" {
  description = "Output of all public subnets"
  value       = values(module.public_subnets)
}
output "public_subnet" {
  description = "The public subnet resources"
  value = var.vpc != null ? {
    for key, item in var.vpc.public_subnets :
    item.name => module.public_subnets[item.name]
  } : null
}
