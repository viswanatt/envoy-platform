variable "aws_region" {
  default = "ap-south-1"
}

variable "cluster_name" {
  default = "envoy-eks"
}

variable "node_instance_type" {
  # t3.medium: 2 vCPU, 4 GB RAM. Good balance for a small cluster.
  default = "t3.small"
}
