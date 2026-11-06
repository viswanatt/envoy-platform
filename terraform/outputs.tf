output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "ecr_api_repository_url" {
  value = aws_ecr_repository.envoy_api.repository_url
}

output "ecr_ui_repository_url" {
  value = aws_ecr_repository.envoy_ui.repository_url
}

output "configure_kubectl" {
  value = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}
