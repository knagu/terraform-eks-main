variable "aws_region" {
  default     = "us-west-2"
  description = "AWS region"
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

variable "ingress-alb" {
  default = "b5273caa-default-websocket-a786-292300899.us-west-2.elb.amazonaws.com"
}

variable "schedule-cdn" {
  default = "djdqd4732r3f5.cloudfront.net"
}

variable "portal-cdn" {
  default = "d2di5n4ghvrdvu.cloudfront.net"
}

variable "video-cdn" {
  default = "dvcjqj10obbp6.cloudfront.net"
}

variable "sidebar-cdn" {
  default = "dw13yrg8q8wep.cloudfront.net"
}

variable "user-cdn" {
  default = "da9al3oivjp53.cloudfront.net"
}

variable "header-cdn" {
  default = "d3p2ti0kfd8nll.cloudfront.net"
}

variable "test-cdn" {
  default = "d1fg7xj7pdjvmz.cloudfront.net"
}

variable "styleguide-cdn" {
  default = "dhsylwtyd02md.cloudfront.net"
}

variable "home-cdn" {
  default = "d5zuvhe8n5d0y.cloudfront.net"
}

variable "resource-cdn" {
  default = "d167mtq93hlh4d.cloudfront.net"
}