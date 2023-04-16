terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "aws-infrastructure"

    workspaces {
      name = "two-tier-terraform"
    }
  }
}
