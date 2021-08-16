variable "aws_region" {
  default     = "us-west-2"
  description = "AWS region"
}
variable "sql_password" {

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