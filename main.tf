# Root Directory 

#   To use the resources defined in child modules within our root module, 
#   add parent modules that reference those child modules.

module "vpc" {             # Parent module
  source = "./modules/vpc" # Relative path to Child module

  # Assign input variables
  name                       = "two_tier"
  region                     = "us-east-1"
  cidr_block                 = "10.0.0.0/16"
  public_subnet_cidr_blocks  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_blocks = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones         = ["us-east-1a", "us-east-1b"]
}

#   Launch an EC2 Instance with Apache webserver in each 
#   public web tier subnet

module "web_server" {
  source = "./modules/ec2_instance"

  ami_id             = "ami-03c7d01cf4dedc891"
  instance_type      = "t2.micro"
  key_name           = "projectkeypair"
  public_subnet_ids  = module.vpc.public_subnet_ids
  security_group_ids = [aws_security_group.ec2_sg.id]
  user_data          = file("apache.sh")
}

# Launch an RDS MySQL Instance in the private RDS subnets

module "mysql_db" {
  source = "./modules/rds_instance"

  db_name             = "twotier"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  engine              = "mysql"
  engine_version      = "8.0"
  rds_username        = var.db_username
  rds_password        = var.db_password
  security_group_ids  = [aws_security_group.rds_sg.id]
  private_subnet_ids  = module.vpc.private_subnet_ids
  skip_final_snapshot = true
}