module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "4.0.1"

  #VPC Basics
  name = var.vpc_name
  cidr = var.vpc_cidr_block
  azs  = var.vpc_availability_zones
  public_subnets = var.vpc_public_subnets
  map_public_ip_on_launch = var.vpc_public_ip
  private_subnets = var.vpc_private_subnets

  # Database Subnets
  database_subnets = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  
  
  #Nat Gateway - Outbound Communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  #subnet tags with naming convention for eks cluster
  private_subnet_tags = {
    "Name"  = "private"
    "kubernetes.io/role/internal-elb" = "1"
    "kubernetes.io/cluster/profisee"  = "owned"
  }
  
  public_subnet_tags = {
    "Name" = "public"
    "kubernetes.io/role/elb" = "1"
    "kubernetes.io/cluster/profisee"  = "owned"
  }
  
  database_subnet_tags = {
    "Name" = "Database Subnets"
  }
}