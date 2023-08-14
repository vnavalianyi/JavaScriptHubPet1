terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.4.0"
    }
  }

  backend "remote"  {
    organization = "VnProject1"

    workspaces {
      name = "JavaScriptWorkspace"
    }  
 }
}

provider "aws" {
    region = var.region
}