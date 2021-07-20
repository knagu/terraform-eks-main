data "terraform_remote_state" "cluster" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "my-CLUSTER"
    }
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = data.terraform_remote_state.cluster.outputs.cluster_id
}

provider "kubernetes" {
  host                   = data.terraform_remote_state.cluster.outputs.cluster_endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = data.terraform_remote_state.cluster.outputs.cluster_ca_certificate
}




resource "kubernetes_deployment" "tomcat" {
  metadata {
    name = "tomcat"
    labels = {
      App = "tomcat"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        App = "tomcat"
      }
    }
    template {
      metadata {
        labels = {
          App = "tomcat"
        }
      }
      spec {
        container {
          image = "knagu/tomcat:v1"
          name  = "tomcat"

          port {
            container_port = 8080
          }

        }
      }
    }
  }
}


resource "kubernetes_service" "tomcat" {
  metadata {
    name = "tomcat"
  }
  spec {
    selector = {
      App = kubernetes_deployment.tomcat.spec.0.template.0.metadata[0].labels.App
    }
    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}
