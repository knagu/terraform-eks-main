###################################################################################################
################################### K8's SECRETS ##################################################
###################################################################################################
resource "kubernetes_secret" "docker" {
  metadata {
    name = "ecr-registry"
  }

  data = {
    ".dockerconfigjson" = <<DOCKER
{
  "auths": {
    "${local.registry_server}": {
      "auth": "${base64encode("${var.registry_username}:${var.registry_password}")}"
    }
  }
}
DOCKER
  }

  type = "kubernetes.io/dockerconfigjson"
}

resource "kubernetes_secret" "sql_server" {
  metadata {
    name = "sql-secret"
  }
  data = {
    sql-root-username = "${data.terraform_remote_state.mssql.outputs.db_instance_username}"
    sql-root-password = "${var.sql_password}"
  }  
}