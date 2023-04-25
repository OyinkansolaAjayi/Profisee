output "private" {
  value = module.vpc.private_subnets[*]
}

output "public" {
  value = module.vpc.public_subnets[*]
}

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "db_name" {
  value = module.vpc.database_subnet_group_name
}

output "vpc_cidr_block" {
  value = module.vpc.vpc_cidr_block
}

output "rdsdb_sg_group_id" {
  description = "The ID of the rdsdb security group"
  value       = module.security_group.security_group_id
}