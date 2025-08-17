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
  region = var.region
}

resource "random_id" "this" {
  byte_length = 2
}

# Exemplo com S3 
resource "aws_s3_bucket" "example" {
  bucket        = "${var.project_name}-${var.suffix}-${random_id.this.hex}"
  force_destroy = true
}
