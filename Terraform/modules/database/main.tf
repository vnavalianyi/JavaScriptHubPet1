resource "aws_default_security_group" "default-sg" {
  vpc_id = var.vpc_id
  ingress {
    description      = "all from myip"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [var.my_ip]
    
  }
/*
  ingress {
    description      = "http"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
*/
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    prefix_list_ids  = []
  }
  tags = {
        Name: "${var.env_prefix}-default-sg"
    }
}

resource "aws_db_instance" "docker_database" {
  allocated_storage            = var.dbstorage
  max_allocated_storage        = var.max_dbstorage
  db_name                      = var.db_name
  engine                       = var.engine
  engine_version               = var.engine_version
  instance_class               = var.instance_class
  username                     = var.dbusename
  password                     = var.dbpassword
  # parameter_group_name = "default.mysql5.7"
  skip_final_snapshot          = true
  publicly_accessible          = false
  performance_insights_enabled = false
  tags = {
        Name: "${var.env_prefix}-db"
    }
}