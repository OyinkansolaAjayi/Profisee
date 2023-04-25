terraform {
  required_version = "~> 1.0" 
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.20"
    }
    kubernetes = { 

      source  = "hashicorp/kubernetes" 
  }
  }
}

# Provider Block
provider "aws" {
  region  = var.aws_region
  profile = "default"
}

provider "kubernetes" { 

  config_path    = "~/.kube/config" 

} 