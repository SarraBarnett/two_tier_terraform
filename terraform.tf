terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  cloud {
    hostname     = "app.terraform.io"
    organization = "aws-infrastructure"

    workspaces {
      name = "two_tier_terraform"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}