module "rds" {
  source  = "terraform-aws-modules/rds/aws"
  version = "5.6.0"

  identifier = var.db_instance_identifier

  username = var.db_name
  password = var.db_password
  port = var.db_port

  engine               = "sqlserver-ex"
  engine_version       = "15.00"
  family               = "sqlserver-ex-15.0" # DB parameter group
  major_engine_version = "15.00"             # DB option group
  instance_class       = "db.t3.medium"

  multi_az = false
  db_subnet_group_name = data.terraform_remote_state.vpc.outputs.db_name
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.rdsdb_sg_group_id]
   

  allocated_storage     = 20
  max_allocated_storage = 100
  storage_encrypted     = false

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["error"]

  backup_retention_period = 0
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = true
  monitoring_interval                   = 60
}