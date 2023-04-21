# Configure Required Provider

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  # Configure Backend State Storage

  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "aws-infrastructure"

    workspaces {
      name = "two_tier_terraform"
    }
  }
}

# Configure the AWS Provider

provider "aws" {
  region = "us-east-1"
}