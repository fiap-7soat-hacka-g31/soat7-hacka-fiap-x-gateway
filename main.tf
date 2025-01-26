resource "aws_apigatewayv2_api" "fiap_x" {
  name          = "fiap_x"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_stage" "dev" {
  api_id      = aws_apigatewayv2_api.fiap_x.id
  name        = "dev"
  auto_deploy = true
}


data "terraform_remote_state" "fiap_x_eks" {
  backend = "s3"
  config = {
    bucket = "tfstate-fiap-7soat-hacka-g31"
    key    = "global/s3/eks.tfstate"
    region = "us-east-1"
  }
}

resource "aws_security_group" "vpc_link" {
  name   = "fiap-burger-k8s-vpc-link"
  vpc_id = data.terraform_remote_state.fiap_x_eks.outputs.fiap_x_vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_apigatewayv2_vpc_link" "fiap_x_eks" {
  name = "fiap-burger-eks"

  security_group_ids = [
    aws_security_group.vpc_link.id
  ]

  subnet_ids = [
    data.terraform_remote_state.fiap_x_eks.outputs.fiap_x_priv_subnet_1a_id,
    data.terraform_remote_state.fiap_x_eks.outputs.fiap_x_priv_subnet_1b_id,
  ]
}
