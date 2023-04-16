terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      region  = "us-east-1"
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
