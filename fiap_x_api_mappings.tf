## VPC Link Connection
resource "aws_apigatewayv2_integration" "fiap_x_api" {
  api_id             = aws_apigatewayv2_api.fiap_x.id
  integration_uri    = var.aws_eks_lb_listener_api_service
  integration_method = "ANY"
  integration_type   = "HTTP_PROXY"
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.fiap_x_eks.id
}

## Route Mappings
resource "aws_apigatewayv2_route" "fiap_x_api_create_video" {
  api_id    = aws_apigatewayv2_api.fiap_x.id
  route_key = "POST /api/v1/me/videos"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_x_api.id}"
}

resource "aws_apigatewayv2_route" "fiap_x_api_list_my_videos" {
  api_id    = aws_apigatewayv2_api.fiap_x.id
  route_key = "GET /api/v1/me/videos"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_x_api.id}"
}

resource "aws_apigatewayv2_route" "fiap_x_api_get_my_video" {
  api_id    = aws_apigatewayv2_api.fiap_x.id
  route_key = "GET /api/v1/me/videos/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_x_api.id}"
}

resource "aws_apigatewayv2_route" "fiap_x_api_download_my_content" {
  api_id    = aws_apigatewayv2_api.fiap_x.id
  route_key = "GET /api/v1/me/videos/{id}/download"
  target    = "integrations/${aws_apigatewayv2_integration.fiap_x_api.id}"
}
