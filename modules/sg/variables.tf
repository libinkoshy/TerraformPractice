variable "name" {
  description = "Name prefix for the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "allowed_cidrs" {
  description = "List of CIDR blocks allowed to access this SG"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}