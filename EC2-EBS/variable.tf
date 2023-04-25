variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"
}

variable "ec2" {
  description = "Name of instance to be created"
  type = string
  default = "Profisee"
}

variable "instance_type" {
  description = "Name of instance to be created"
  type = string
  default = "t2.micro"
}

variable "availability_zone" {
  description = "Region where ec2/ebs will be created"
  type = string
  default = "us-east-1a"
}

variable "size" {
  description = "Size of ebs volume"
  type = number
  default = 8
}

variable "device_name" {
  description = "device name for the ec2 instance"
  type = string
  default = "/dev/sdh"
}
