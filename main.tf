resource "aws_apigatewayv2_api" "fiap_burger" {
  name          = "fiap_burger"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "dev" {
  api_id      = aws_apigatewayv2_api.fiap_burger.id
  name        = "dev"
  auto_deploy = true
}

