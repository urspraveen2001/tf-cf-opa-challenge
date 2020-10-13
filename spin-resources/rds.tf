resource "aws_db_instance" "rds_challenge" {
  allocated_storage    = 20
  storage_type         = "gp2"
  skip_final_snapshot  = "true"
  identifier_prefix    = "rdschallenge"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "rdschallenge"
  username             = "challenge"
  password             = "Challenge"
  parameter_group_name = "default.mysql5.7"
}