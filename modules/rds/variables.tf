variable "db_identifier" {
  description = "Unique identifier for the RDS instance"
  type        = string
}

variable "engine" {
  description = "Database engine (postgres, mysql, etc.)"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "Engine version"
  type        = string
  default     = "17.4"
}

variable "instance_class" {
  description = "Instance type for RDS"
  type        = string
  default     = "db.t3.micro" # free-tier eligible
}

variable "allocated_storage" {
  description = "Storage in GB"
  type        = number
  default     = 20
}

variable "db_name" {
  description = "Initial database name"
  type        = string
  default     = "mydb"
}

variable "username" {
  description = "Master username"
  type        = string
  default     = "admin"
}

variable "password" {
  description = "Master password"
  type        = string
  sensitive   = true
}

variable "publicly_accessible" {
  description = "Whether the RDS instance is publicly accessible"
  type        = bool
  default     = false
}

variable "skip_final_snapshot" {
  description = "Skip final snapshot before deletion"
  type        = bool
  default     = true
}

variable "storage_type" {
  description = "Storage type (gp2/gp3)"
  type        = string
  default     = "gp3"
}

variable "availability_zone" {
  description = "AZ to launch RDS"
  type        = string
  default     = "us-east-1a"
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs"
  type        = list(string)
  default     = []
}

variable "db_subnet_group_name" {
  description = "DB subnet group name"
  type        = string
  default     = null
}

variable "backup_retention_period" {
  description = "Number of days to retain backups"
  type        = number
  default     = 1
}

variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default     = {}
}

