# Root Directory - Input Variables
variable "db_username" {
  type = string
}

variable "db_password" {
  description = "Password for the RDS instance"
  default     = ""
}