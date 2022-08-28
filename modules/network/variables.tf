variable "vpc_cidr" {
  description = "CIDR range for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_id" {
  description = "the id of the vpc"
  type        = string
  default     = "aws_vpc.two_tier_vpc.id"
}