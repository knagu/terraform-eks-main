resource "aws_iam_openid_connect_provider" "default" {
  url = data.aws_eks_cluster.cluster.identity.0.oidc.0.issuer

  client_id_list = [
    "sts.amazonaws.com",
  ]

  thumbprint_list = [
    "9e99a48a9960b14926bb7f3b02e22da2b0ab7280"
  ]  
}

module "dev_alb_ingress_controller" {
  source  = ".\\Modules\\alb-ingress-controller"
  #version = "3.1.0"
  
  k8s_cluster_type = "eks"
  k8s_namespace = "kube-system"
  aws_vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  aws_region_name  = "${var.aws_region}"  
  aws_alb_ingress_class = "alb"
  k8s_cluster_name = data.terraform_remote_state.vpc.outputs.cluster_name

  prefix = "${var.prefix}"    
  project = "${var.project}"

  depends_on = [
    aws_iam_openid_connect_provider.default
  ]
}

###############################################################################

resource "kubernetes_namespace" "prod" {
  metadata {   
    name = "prod"
  }
}

resource "kubernetes_namespace" "dev" {
  metadata {   
    name = "dev"
  }
}
