terraform {
  required_version = ">= 1.0.0"
  required_providers {
    # The AWS provider is used to manage resources in Amazon Web Services.
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.25"
    }
    # The Azure provider is used to manage resources in Microsoft Azure.
    azure = {
      source  = "hashicorp/azurerm"
      version = "~> 3.17"
    }
  }
}

# The AWS provider is used to manage resources in Amazon Web Services.
# The Azure provider is used to manage resources in Microsoft Azure.    
# The `features {}` block is required for the Azure provider to function correctly.
# The `skip_provider_registration` argument has been removed as it is deprecated.
# The `region` and `profile` arguments are used to specify the AWS region and profile to use.

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
provider "azure" {
  features {}

  # Removed deprecated argument "skip_provider_registration"
}
