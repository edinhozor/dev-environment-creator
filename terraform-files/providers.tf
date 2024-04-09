#Define cloud provider - in this case AWS.
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#Define provider region and provide the directory where the AWS credentials are stored, also choose the profile.
provider "aws" {
  region                   = "sa-east-1"
  shared_credentials_files = ["/Users/edinn/.aws/credentials"]
  profile                  = "vscode"
}

