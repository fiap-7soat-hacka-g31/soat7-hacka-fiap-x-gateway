output "apigateway_id" {
  description = "API Gateway ID"
  value       = aws_apigatewayv2_api.fiap_x.id
  sensitive   = true
}

output "apigateway_url" {
  description = "API Gateway Base URL"
  value       = aws_apigatewayv2_stage.dev.invoke_url
  sensitive   = true
}

output "apigateway_execution_arn" {
  description = "API Gateway Execution ARN"
  value       = aws_apigatewayv2_api.fiap_x.execution_arn
  sensitive   = true
}
