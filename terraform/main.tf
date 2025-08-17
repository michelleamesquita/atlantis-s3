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

# Recurso simples e barato: SSM Parameter (evita nome único global do S3)
resource "aws_ssm_parameter" "example" {
  name  = "/${var.project_name}/${var.suffix}-${random_id.this.hex}"
  type  = "String"
  value = "created-by-gh-actions"
}

output "parameter_name" {
  value = aws_ssm_parameter.example.name
}
