terraform {
  required_version = ">= 0.11.2"
  region = "us-west-2"

  backend "s3" {
    bucket = "dngo.terraform.states"
    key    = "sample.tfstate"
    region = "us-west-2"
  }
}

provider "aws" {
  region  = "us-west-2"
  version = "~> 1.6"
}
