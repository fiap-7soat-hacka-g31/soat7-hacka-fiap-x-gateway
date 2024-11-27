## VPC Link Connection
resource "aws_apigatewayv2_integration" "fiap_burger_preparation" {
  api_id             = aws_apigatewayv2_api.fiap_burger.id
  integration_uri    = var.aws_eks_lb_listener_preparation_service
  integration_method = "ANY"
  integration_type   = "HTTP_PROXY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.fiap_burger_eks.id
}

## Route Mappings
resource "aws_apigatewayv2_route" "fiap_burger_preparation_advance" {
  api_id    = aws_apigatewayv2_api.fiap_burger.id
  route_key = "PATCH /fiap-burger-preparation/v1/preparations/{id}/advance"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_burger_preparation.id}"
}

resource "aws_apigatewayv2_route" "fiap_burger_preparation_get" {
  api_id    = aws_apigatewayv2_api.fiap_burger.id
  route_key = "PATCH /fiap-burger-preparation/v1/preparations/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_burger_preparation.id}"
}

resource "aws_apigatewayv2_route" "fiap_burger_preparation_find" {
  api_id    = aws_apigatewayv2_api.fiap_burger.id
  route_key = "PATCH /fiap-burger-preparation/v1/preparations"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_burger_preparation.id}"
}
