resource "hcp_vault_cluster" "vault_cluster" {
  hvn_id     = hcp_hvn.hvn.hvn_id
  cluster_id = "${var.prefix}-${var.project}-${var.env}-vault-uswest2"
  public_endpoint = true
  tier = "dev"
}

resource "hcp_vault_cluster_admin_token" "vault_admin_token" {
  cluster_id = hcp_vault_cluster.vault_cluster.cluster_id
}
