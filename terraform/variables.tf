variable "region" {
  type        = string
  description = "Região AWS"
  default     = "us-east-1"
}

variable "project_name" {
  type        = string
  description = "Nome lógico do projeto"
  default     = "poc-atlantis-actions-michelle"
}

variable "suffix" {
  type        = string
  description = "Sufixo (ex.: pr-<num>)"
  default     = "local"
}
