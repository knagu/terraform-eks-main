variable "aws_region" {
  default     = "us-west-2"
  description = "AWS region"
}

variable "registry_username" {
  default = "AWS"
}

variable "hcp_client_id" {

}

variable "hcp_client_secret"{

}

variable "prefix" {
  default = "dax"
}

variable "project" {
  default = "coreinfra"
}

variable "env" {
  default = "dev"
}