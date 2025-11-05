variable "origin_id" {
  description = "Unique identifier for the origin"
  type        = string
}

variable "origin_domain_name" {
  description = "Domain name of the origin (e.g., S3 bucket endpoint)"
  type        = string
}

variable "default_root_object" {
  description = "Default root object"
  type        = string
  default     = "index.html"
}

variable "aliases" {
  description = "Alternative domain names (CNAMEs)"
  type        = list(string)
  default     = []
}

variable "acm_certificate_arn" {
  description = "ARN of the ACM certificate for HTTPS"
  type        = string
  default     = null
}

variable "price_class" {
  description = "CloudFront price class"
  type        = string
  default     = "PriceClass_100"
}

variable "enabled" {
  description = "Whether the distribution is enabled"
  type        = bool
  default     = true
}

variable "default_ttl" {
  description = "Default TTL for cached objects"
  type        = number
  default     = 3600
}
 
variable "s3_bucket_domain_name" {
  description = "Domain name of the S3 bucket"
  type        = string
}
