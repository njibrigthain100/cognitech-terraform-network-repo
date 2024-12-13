variable "common" {
  description = "Common variables used by all resources"
  type = object({
    global        = bool
    tags          = map(string)
    account_name  = string
    region_prefix = string
  })
  default = null
}

variable "vpc" {
  description = "The vpc to be created"
  type = object({
    name       = string
    cidr_block = string
  })
  default = null
}
variable "private_subnets" {
  description = "The private subnet variables"
  type = list(object({
    private_subnet_name       = string
    private_subnet_cidr_block = list(string)
    az                        = list(string)
  }))
  default = null
}

variable "public_subnets" {
  description = "The public subnet variables"
  type = list(object({
    public_subnet_name       = string
    public_subnet_cidr_block = list(string)
    az                       = list(string)
  }))
  default = null
}

variable "eip" {
  description = "The public subnet to e associated to the elastic ip"
  type = list(object({
    name = list(string)
  }))
  default = null
}
variable "ngw" {
  description = "The nat gateway to be associated to the private subnet"
  type = list(object({
    name = list(string)
    # subnet_id     = string
    # allocation_id = string
  }))
  default = null
}








