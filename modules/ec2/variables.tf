#---2-Tier-TCloud/modules/ec2/variables.tf


variable "region_a" {
  description = "The region the environment is going to be installed into"
  type        = string
  default     = "us-east-1a"
}


variable "region_b" {
  description = "The region the environment is going to be installed into"
  type        = string
  default     = "us-east-1b"
}


variable "ami" {
  description = "The image we will be working with"
  type        = string
  #Your prefered ami
  default = "ami-05fa00d4c63e32376" #Amazon Linux 2
}


variable "aws_instance" {
  description = "The instance type we will be working with"
  type        = string
  #Your prefered instance type
  default = "t2.micro"
}