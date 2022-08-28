#---2-Tier-TCloud/providers/variables.tf

variable "region" {
  description = "The region the environment is going to be installed into"
  type        = string
  default     = "us-east-1"
}
