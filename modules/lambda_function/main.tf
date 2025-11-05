resource "aws_iam_role" "lambda_exec_role" {
  name = "${var.lambda_function_name}_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_policy" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "lambda_func" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  runtime       = var.lambda_runtime
  role          = aws_iam_role.lambda_exec_role.arn
  filename      = var.lambda_zip_path
  source_code_hash = filebase64sha256(var.lambda_zip_path)
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory

  environment {
    variables = var.environment_variables
  }

  tags = {
    Project = "LambdaModule"
  }
}
