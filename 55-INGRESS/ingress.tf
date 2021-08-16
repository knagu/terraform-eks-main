resource "aws_iam_openid_connect_provider" "default" {
  url = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [
    "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
  ]  
}

module "alb_ingress_controller" {
  source  = "iplabs/alb-ingress-controller/kubernetes"
  version = "3.1.0"
  
  k8s_cluster_type = "eks"
  k8s_namespace = "kube-system"
  aws_vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  aws_region_name  = "${var.aws_region}"
  k8s_cluster_name = data.terraform_remote_state.vpc.outputs.cluster_name
  depends_on = [
    aws_iam_openid_connect_provider.default
  ]
}