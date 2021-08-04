variable "aws_region" {
  default     = "us-west-2"
  description = "AWS region"
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
