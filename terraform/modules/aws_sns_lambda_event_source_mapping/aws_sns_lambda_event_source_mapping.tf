
resource "aws_sns_topic_subscription" "lambda_subscription" {
  topic_arn = var.topic_arn
  protocol  = "lambda"
  endpoint  = var.lambda_function_arn
}

 