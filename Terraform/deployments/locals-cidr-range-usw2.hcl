locals {
  cidr_blocks = {
    mdp = {
      segments = {
        shared_services = {
          vpc = "10.1.2.0/24"
          subnets = {
            public = {
              primary   = ["10.1.2.128/26", "10.1.2.192/26"]
              secondary = ["10.1.2.128/26", "10.1.2.192/26"]
            }
            private = {
              primary   = ["10.1.1.0/26", "10.1.1.64/26"]
              secondary = ["10.1.1.0/26", "10.1.1.64/26"]
            }
          }
        }
        sit = {
          vpc = "10.1.1.0/24"
          subnets = {
            public = {
              primary   = ["10.1.1.128/26", "10.1.1.192/26"]
              secondary = ["10.1.1.128/26", "10.1.1.192/26"]
            }
            private = {
              primary   = ["10.1.1.0/26", "10.1.1.64/26"]
              secondary = ["10.1.1.0/26", "10.1.1.64/26"]
            }
          }
        }
        trn = {
          vpc = "10.1.3.0/24"
          subnets = {
            public = {
              primary   = ["10.1.3.128/26", "10.1.3.192/26"]
              secondary = ["10.1.3.128/26", "10.1.3.192/26"]
            }
            private = {
              primary   = ["10.1.3.0/26", "10.1.3.64/26"]
              secondary = ["10.1.3.0/26", "10.1.3.64/26"]
            }
          }
        }
      }
    }
  }
}
