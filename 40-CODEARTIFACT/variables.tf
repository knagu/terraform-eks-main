variable "aws_region" {
  default     = "us-west-2"
  description = "AWS region"
}
variable "aws_access_key" {

}
variable "aws_secret_key" {

}

variable "codeartifact_domain" {
  default = "daxeos"
}

variable "codeartifact_repository" {
  default = "sample"
}

variable "codeartifact_upstream" {
  default = "nuget-store"
}
