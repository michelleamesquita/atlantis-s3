variable "project_name" {
  type        = string
  description = "Nome lógico do projeto."
  default     = "poc-atlantis-actions-michelle"
}

variable "suffix" {
  type        = string
  description = "Sufixo de unicidade (ex: número do PR)."
  default     = "local"
}
