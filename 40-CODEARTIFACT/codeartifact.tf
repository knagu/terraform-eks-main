data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-05-IAM"
    }
  }
}

resource "aws_kms_key" "codeartifact_key" {
  description = "domain key"
}

resource "aws_codeartifact_domain" "codeartifact_domain" {
  domain         = var.codeartifact_domain
  encryption_key = aws_kms_key.codeartifact_key.arn
}

resource "aws_codeartifact_repository" "codeartifact_upstream" {
  repository = "${var.prefix}-${var.project}-${var.env}-codeartifact-uswest2-nuget-store"
  domain     = aws_codeartifact_domain.codeartifact_domain.domain

  external_connections {
    external_connection_name = "public:nuget-org"
  }
}

resource "aws_codeartifact_repository" "codeartifact_repository" {
  repository = "${var.prefix}-${var.project}-${var.env}-codeartifact-uswest2-daxeos"
  domain     = aws_codeartifact_domain.codeartifact_domain.domain

  upstream {
    repository_name = aws_codeartifact_repository.codeartifact_upstream.repository
  }
}

data "aws_codeartifact_repository_endpoint" "codeartifact_endpoint" {
  domain     = aws_codeartifact_domain.codeartifact_domain.domain
  repository = aws_codeartifact_repository.codeartifact_repository.repository
  format     = "nuget"
}
