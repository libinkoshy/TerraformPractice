variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_handler" {
  description = "Lambda handler"
  type        = string
  default     = "index.lambda_handler"
}

variable "lambda_runtime" {
  description = "Runtime environment"
  type        = string
  default     = "python3.9"
}

variable "lambda_zip_path" {
  description = "Path to Lambda zip file"
  type        = string
  default     = "lambda_function_payload.zip"
}

variable "lambda_timeout" {
  description = "Timeout for Lambda function"
  type        = number
  default     = 10
}

variable "lambda_memory" {
  description = "Memory size for Lambda function"
  type        = number
  default     = 128
}

variable "environment_variables" {
  description = "Environment variables for Lambda"
  type        = map(string)
  default     = {}
}
