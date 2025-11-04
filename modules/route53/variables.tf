variable "domain_name" {
  description = "The domain name to create or manage"
  type        = string
}
variable "hosted_zone_id" {
  description = "The Route 53 hosted zone ID for the domain"
  type        = string
}

variable "alias_name" {
  description = "The DNS name to point the alias record to (e.g., ALB DNS)"
  type        = string
}

variable "alias_zone_id" {
  description = "The hosted zone ID of the alias target (e.g., ALB hosted zone)"
  type        = string
}