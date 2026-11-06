resource "aws_ecr_repository" "envoy_api" {
  name                 = "envoy-api"
  image_tag_mutability = "MUTABLE"
}

resource "aws_ecr_repository" "envoy_ui" {
  name                 = "envoy-ui"
  image_tag_mutability = "MUTABLE"
}
