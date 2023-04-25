variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

variable "cluster_name" {
  description = "name of the cluster"
  type = string
  default = "profisse"
}

variable "cluster_version" {
  description = "cluster version"
  type = string
  default = "1.25"
}

variable "public_access" {
  description = "public endpoint access"
  type = bool
  default = true
}

variable "private_access" {
  description = "private endpoint access"
  type = bool
  default = true
}

variable "irsa" {
  description = "identity role for service accounts"
  type = bool
  default = true
}

