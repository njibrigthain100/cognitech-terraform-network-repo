variable "common" {
  description = "Common variables used by all resources"
  type = object({
    global        = bool
    tags          = map(string)
    account_name  = string
    region_prefix = string
    region        = string
  })
  default = null
}
variable "vpc" {
  description = "All VPC resources to be created"
  type = object({
    name       = string
    cidr_block = string
    private_subnets = list(object({
      name                          = string
      primary_availabilty_zone      = optional(string)
      primary_availabilty_zone_id   = optional(string)
      primary_cidr_block            = string
      secondary_availabilty_zone    = optional(string)
      secondary_availabilty_zone_id = optional(string)
      secondary_cidr_block          = optional(string)
      tertiary_availabilty_zone     = optional(string)
      tertiary_availabilty_zone_id  = optional(string)
      tertiary_cidr_block           = optional(string)
    }))
    public_subnets = object({
      name                          = string
      primary_availabilty_zone      = optional(string)
      primary_availabilty_zone_id   = optional(string)
      primary_cidr_block            = optional(string)
      secondary_availabilty_zone    = optional(string)
      secondary_availabilty_zone_id = optional(string)
      secondary_cidr_block          = optional(string)
      tertiary_availabilty_zone     = optional(string)
      tertiary_availabilty_zone_id  = optional(string)
      tertiary_cidr_block           = optional(string)
    })
    nat_gateway = optional(object({
      name             = string
      type             = string
      primary_subnet   = optional(string)
      secondary_subnet = optional(string)
    }))
  })
  default = null
}







