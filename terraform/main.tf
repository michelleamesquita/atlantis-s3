terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.5"
    }
  }
}

provider "aws" {
  region = var.region != null ? var.region : "us-east-1"
}

variable "region" {
  type        = string
  description = "Região AWS"
  default     = "us-east-1"
}

resource "random_id" "this" {
  byte_length = 2
}

resource "aws_s3_bucket" "example" {
  bucket = "poc-atlantis-actions-michelle-${random_id.this.hex}"
}

output "parameter_name" {
  value = aws_ssm_parameter.example.name
}
