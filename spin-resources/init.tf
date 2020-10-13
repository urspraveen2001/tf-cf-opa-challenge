terraform {
  required_version = ">= 0.12"
  backend "s3" { 
    region = "ap-southeast-2"
    }
}
provider "aws" {
  version     = "~> 2.0"
  region      = "ap-southeast-2"
  max_retries = 10
}