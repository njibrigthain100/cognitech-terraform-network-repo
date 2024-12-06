# output "vpc" {
#   description = "The vpc outputs"
#   value = var.vpc != null ? {
#     for key, item in module.vpc :
#     key => {
#       vpc_id = item.vpc_id
#       igw_id = item.igw_id
#     }
#   } : null
# }

output "vpc_id" {
  description = "The id of the vpc created"
  value       = module.vpc.vpc_id
}


output "igw_id" {
  description = "The internet gateway id"
  value       = module.vpc.igw_id
}
