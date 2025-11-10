provider "aws" {
  region = "eu-west-1"
}

module "acm" {
  source = "./../../"

  name        = "certificate"
  environment = "test"

  import_certificate = true
  private_key        = "./../../cypik-private-key.pem"
  certificate_body   = "./../../cypik-cert.pem"
  certificate_chain  = "./../../cypik-chain.crt"
}