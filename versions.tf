terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "tfstate-fiap-7soat-hacka-g31"
    key    = "global/s3/gtw.tfstate"
    region = "us-east-1"
  }
}
