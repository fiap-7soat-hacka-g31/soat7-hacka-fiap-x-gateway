## VPC Link Connection
resource "aws_apigatewayv2_integration" "fiap_burger_payments" {
  api_id             = aws_apigatewayv2_api.fiap_burger.id
  integration_uri    = var.aws_eks_lb_listener_payments_service
  integration_method = "ANY"
  integration_type   = "HTTP_PROXY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.fiap_burger_eks.id
}

## Route Mappings
resource "aws_apigatewayv2_route" "fiap_burger_payments_approve" {
  api_id    = aws_apigatewayv2_api.fiap_burger.id
  route_key = "PATCH /dev/fiap-burger-payments/v1/payments/{id}/approve"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_burger_payments.id}"
}

resource "aws_apigatewayv2_route" "fiap_burger_payments_reject" {
  api_id    = aws_apigatewayv2_api.fiap_burger.id
  route_key = "PATCH /dev/fiap-burger-payments/v1/payments/{id}/reject"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_burger_payments.id}"
}
