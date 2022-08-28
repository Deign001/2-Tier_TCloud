#---2-Tier-TCloud/providers/main.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.28.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.3.2"
    }
  }
  required_version = ">= 0.15.0"

  # cloud {
  #   organization = "Deign001"

  #   workspaces {
  #     name = "2-Tier"
  #   }
  # }
}