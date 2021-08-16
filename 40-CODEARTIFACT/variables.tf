variable "aws_region" {
  default     = "us-west-2"
  description = "AWS region"
}
variable "codeartifact_domain" {
  default = "daxeos"
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