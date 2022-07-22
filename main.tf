terraform {
  required_version = ">= 1.1.0"
  required_providers {
    aws = ">= 4"
  }
}

provider "aws" {
  profile             = "default"
  shared_config_files = "~/.aws/credentials"
  region              = "us-east-1"
}
