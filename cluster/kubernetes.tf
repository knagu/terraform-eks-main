provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

resource "aws_iam_openid_connect_provider" "default" {
  url = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = []
  depends_on = [
    module.eks
  ]
}

module "alb_ingress_controller" {
  source  = "iplabs/alb-ingress-controller/kubernetes"
  version = "3.1.0"
  
  k8s_cluster_type = "eks"
  k8s_namespace = "kube-system"
  aws_vpc_id = data.terraform_remote_state.cluster.outputs.vpc_id
  aws_region_name  = "us-west-2"
  k8s_cluster_name = data.terraform_remote_state.cluster.outputs.cluster_name
  depends_on = [
    aws_iam_openid_connect_provider.default
  ]
}