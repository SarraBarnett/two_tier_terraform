# Configure Required Provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Configure Backend State Storage
terraform {
  cloud {
    hostname     = "app.terraform.io"
    organization = "aws-infrastructure"

    workspaces {
      name = "two_tier_terraform"
    }
  }
}
