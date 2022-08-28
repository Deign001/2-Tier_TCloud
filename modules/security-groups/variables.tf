variable "vpc_id" {
  description = "the id of the vpc"
  type        = string
  default     = "aws_vpc.two_tier_vpc.id"
}