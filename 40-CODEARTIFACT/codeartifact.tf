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

resource "aws_codeartifact_repository" "codeartifact_nuget_upstream" {
  repository = "${var.prefix}-${var.project}-${var.env}-codeartifact-uswest2-nuget-store"
  domain     = aws_codeartifact_domain.codeartifact_domain.domain

  external_connections {
    external_connection_name = "public:nuget-org"
  }
}

resource "aws_codeartifact_repository" "codeartifact_nuget_repository" {
  repository = "${var.prefix}-${var.project}-${var.env}-codeartifact-uswest2-nuget"
  domain     = aws_codeartifact_domain.codeartifact_domain.domain

  upstream {
    repository_name = aws_codeartifact_repository.codeartifact_nuget_upstream.repository
  }
}


resource "aws_codeartifact_repository" "codeartifact_npm_upstream" {
  repository = "${var.prefix}-${var.project}-${var.env}-codeartifact-uswest2-npm-store"
  domain     = aws_codeartifact_domain.codeartifact_domain.domain

  external_connections {
    external_connection_name = "public:npmjs"
  }
}

resource "aws_codeartifact_repository" "codeartifact_npm_repository" {
  repository = "${var.prefix}-${var.project}-${var.env}-codeartifact-uswest2-npm"
  domain     = aws_codeartifact_domain.codeartifact_domain.domain

  upstream {
    repository_name = aws_codeartifact_repository.codeartifact_npm_upstream.repository
  }
}


data "aws_codeartifact_repository_endpoint" "codeartifact_nuget_endpoint" {
  domain     = aws_codeartifact_domain.codeartifact_domain.domain
  repository = aws_codeartifact_repository.codeartifact_nuget_repository.repository
  format     = "nuget"
}


data "aws_codeartifact_repository_endpoint" "codeartifact_npm_endpoint" {
  domain     = aws_codeartifact_domain.codeartifact_domain.domain
  repository = aws_codeartifact_repository.codeartifact_npm_repository.repository
  format     = "npm"
}
