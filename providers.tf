terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "remote" {
    organization = "aws-infrastructure"

    workspaces {
      name = "two-tier-terraform"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}