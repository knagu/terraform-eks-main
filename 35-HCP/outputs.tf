output "vault_private_endpoint_url" {
    value = hcp_vault_cluster.vault_cluster.vault_private_endpoint_url
}

output "vault_public_endpoint_url" {
    value = hcp_vault_cluster.vault_cluster.vault_public_endpoint_url
}

output "vault_namespace" {
    value = hcp_vault_cluster.vault_cluster.namespace
}

output "vault_token" {
    value = base64encode(hcp_vault_cluster_admin_token.vault_admin_token.token)
    sensitive = true
}