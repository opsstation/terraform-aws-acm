provider "aws" {
  region = "us-west-1"
}

locals {
  domain = "opsstation.com"
}

module "acm" {
  source                    = "./../../"
  name                      = "certificate"
  environment               = "test"
  domain_name               = "opsstation.com"
  subject_alternative_names = ["*.${local.domain}", "www.${local.domain}"]
}
