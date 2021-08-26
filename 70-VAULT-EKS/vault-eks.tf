data "kubernetes_service_account" "helm_sa" {
  metadata {
    name = "vault"
  }
  depends_on = [
    helm_release.vault_agent
  ]
}

data "kubernetes_secret" "vault_secret" {
  metadata {
    name = "${data.kubernetes_service_account.helm_sa.default_secret_name}"
  }  
}

############################################################################################

resource "kubernetes_service_account" "vault_sa" {
  metadata {
    name = "internal-app"
  } 
}

resource "vault_auth_backend" "kubernetes" {
  type = "kubernetes"
  depends_on = [
    helm_release.vault_agent
  ]
}

resource "vault_kubernetes_auth_backend_config" "kubernetes_auth" {
  backend                = vault_auth_backend.kubernetes.path
  kubernetes_host        = "${data.terraform_remote_state.cluster.outputs.cluster_endpoint}"
  kubernetes_ca_cert     = "${data.kubernetes_secret.vault_secret.data["ca.crt"]}"
  token_reviewer_jwt     = "${data.kubernetes_secret.vault_secret.data["token"]}"  
}


resource "vault_policy" "kubernetes_policy" {
  name = "devwebapp"

  policy = <<EOT
path "secret/data/devwebapp/config" {
  capabilities = ["read"]
}
EOT
}

resource "vault_kubernetes_auth_backend_role" "kubernetes_auth_role" {
  backend                          = vault_auth_backend.kubernetes.path
  role_name                        = "devwebapp"
  bound_service_account_names      = ["internal-app"]
  bound_service_account_namespaces = ["default"]
  token_ttl                        = 86400
  token_policies                   = ["devwebapp"]  
  
  depends_on = [
    kubernetes_service_account.vault_sa
  ]

}