# ID to use for test environment
# ( image, slug, snapshot, or backup )
variable "backup_id" {
  description = "ID of the backup image to test with (omit to disable)"
  type        = any
  default     = null
}

variable "op_connect_token" {
  description = "Access token for 1Password Connect"
  type        = string
  sensitive   = true
}
