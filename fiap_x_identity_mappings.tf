## VPC Link Connection
resource "aws_apigatewayv2_integration" "fiap_x_identity" {
  api_id             = aws_apigatewayv2_api.fiap_x.id
  integration_uri    = var.aws_eks_lb_listener_identity_service
  integration_method = "ANY"
  integration_type   = "HTTP_PROXY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.fiap_x_eks.id
}

## Route Mappings
resource "aws_apigatewayv2_route" "fiap_x_identity_sign_up" {
  api_id    = aws_apigatewayv2_api.fiap_x.id
  route_key = "POST /identity/v1/auth/sign-up"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_x_identity.id}"
}

resource "aws_apigatewayv2_route" "fiap_x_identity_sign_in" {
  api_id    = aws_apigatewayv2_api.fiap_x.id
  route_key = "POST /identity/v1/auth/sign-in"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_x_identity.id}"
}
