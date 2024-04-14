resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  db_name              = "mysql"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin1"
  password             = "roboshop1"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}
resource "aws_db_subnet_group" "mysql" {
  name       = "roboshop-${var.ENV}-mysql-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

  tags = {
    Name = "roboshop-${var.ENV}-mysql-subnet-group"
  }
}

# # Creates Elastic Cache cluster
# resource "aws_elasticache_cluster" "redis" {
#   cluster_id           = "roboshop-${var.ENV}-redis"
#   engine               = "redis"
#   node_type            = "cache.t3.small"
#   num_cache_nodes      = 1
#   parameter_group_name = aws_elasticache_parameter_group.redis.name
#   subnet_group_name    = aws_elasticache_subnet_group.redis.name
#   security_group_ids   = [aws_security_group.allows_redis.id]
#   engine_version       = "6.2"
#   port                 = 6379
# }

# resource "aws_elasticache_parameter_group" "redis" {
#   name   = "roboshop-${var.ENV}-redis-pg"
#   family = "redis6.x"
# }


# resource "aws_elasticache_subnet_group" "redis" {
#   name       = "roboshop-${var.ENV}-redis-subnet-group"
#   subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS
#   tags = {
#     Name = "roboshop-${var.ENV}-redis-subnet-group"
#   }
# }

