resource "aws_db_instance" "this" {
  identifier              = var.db_identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  instance_class          = var.instance_class
  allocated_storage       = var.allocated_storage
  db_name                 = var.db_name
  username                = var.username
  password                = var.password
  publicly_accessible     = var.publicly_accessible
  skip_final_snapshot     = var.skip_final_snapshot
  storage_type            = var.storage_type
  availability_zone       = var.availability_zone
  vpc_security_group_ids  = var.vpc_security_group_ids
  db_subnet_group_name    = var.db_subnet_group_name
  deletion_protection     = false
  backup_retention_period = var.backup_retention_period

  tags = merge(
    {
      Name = var.db_identifier
    },
    var.tags
  )
}
