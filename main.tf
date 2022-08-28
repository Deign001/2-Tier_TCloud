#---2-Tier-TCloud/main.tf

module "providers" {
  source = "./providers"
}

module "aws_vpc" {
  source = "./modules/network"
  providers = {
    aws = aws.west
  }
}
