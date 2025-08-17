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

variable "project_name" {
  type        = string
  default     = "poc-atlantis-actions-michelle"
}

variable "suffix" {
  type        = string
  description = "Sufixo (ex: pr-<num>)"
  default     = "local"
}

resource "random_id" "this" {
  byte_length = 2
}

# 🔄 Agora criamos um BUCKET S3 
resource "aws_s3_bucket" "example" {
  bucket = "${var.project_name}-${var.suffix}-${random_id.this.hex}"
  force_destroy = true # facilita 'destroy' em PoC (apaga objetos junto)
}
