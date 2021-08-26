data "terraform_remote_state" "iam" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-05-IAM"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "Harika"
    workspaces = {
      name = "dev-10-VPC"
    }
  }
}

resource "hcp_hvn" "hvn" {
  hvn_id         = "${var.prefix}-${var.project}-${var.env}-hvn-uswest2"
  cloud_provider = "aws"
  region         = var.aws_region
  cidr_block     = "172.27.16.0/20"
}

resource "hcp_aws_network_peering" "peering" {
  peering_id      = "${var.prefix}-${var.project}-${var.env}-peering-uswest2"
  hvn_id          = hcp_hvn.hvn.hvn_id
  peer_vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  peer_account_id = data.terraform_remote_state.vpc.outputs.vpc_owner_id
  peer_vpc_region = var.aws_region
}

// Create an HVN route that targets your HCP network peering and matches your AWS VPC's CIDR block
resource "hcp_hvn_route" "example" {
  hvn_link         = hcp_hvn.hvn.self_link
  hvn_route_id     = "${var.prefix}-${var.project}-${var.env}-hvnroute-uswest2"
  destination_cidr = data.terraform_remote_state.vpc.outputs.vpc_cidr_block
  target_link      = hcp_aws_network_peering.peering.self_link
}

// Accept the VPC peering within your AWS account.
resource "aws_vpc_peering_connection_accepter" "peer" {
  vpc_peering_connection_id = hcp_aws_network_peering.peering.provider_peering_id
  auto_accept               = true
}