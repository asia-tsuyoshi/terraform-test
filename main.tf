main.tf

terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "YOUR TF STATE BUCKET"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecs_cluster" "sandcastle" {
  name = "sandcastle"
  capacity_providers = [
    "FARGATE",
    "FARGATE_SPOT",
  ]
}