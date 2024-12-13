terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn = "arn:aws:sts::471112756438:assumed-role/jenkins_role/i-05ab94c1ea30185a1"
  }

}