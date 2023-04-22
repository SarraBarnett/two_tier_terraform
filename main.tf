# Root Directory 

#   To use the resources defined in child modules within our root module, 
#   add parent modules that reference those child modules.

module "vpc" {
  source = "./modules/vpc" # relative path to child module
  # Assign input variables
  name                = "two_tier-vpc"
  region              = "us-east-1"
  cidr_block          = "10.0.0.0/16"
  public_subnet_cidr  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr = ["10.0.10.0/24", "10.0.11.0/24"]

}


module "security_groups" {
  source                   = "./modules/security_groups"
  name                     = "two_tier-sg"
  vpc_id                   = module.vpc.vpc_id
  web_server_ingress_ports = [80, 443]
  rds_ingress_ports        = [3306]
  web_sg_ids               = [module.security_groups.web_server_sg_id]
  rds_sg_ids               = [module.security_groups.rds_sg_id]
  subnet_ids               = module.vpc.private_subnet_ids
}

#   Launch an EC2 Instance with Apache webserver in each 
#   public web tier subnet 

module "web_server" {
  source           = "./modules/ec2_instance"
  name_prefix      = "web-tier"
  ami              = "ami-069aabeee6f53e7bf"
  instance_type    = "t2.micro"
  key_name         = "projectkeypair"
  web_server_sg_id = module.security_groups.web_server_sg_id
  subnet_ids       = module.vpc.public_subnet_ids
  user_data             = filebase64("apache.sh")
}


# Launch an RDS MySQL Instance in the private RDS subnets

module "rds_instance" {
  source             = "./modules/rds_instance"
  db_name            = "twotier"
  allocated_storage  = 10
  instance_class     = "db.t2.micro"
  engine             = "mysql"
  engine_version     = "8.0"
  rds_username       = var.db_username
  rds_password       = var.db_password
  security_group_id  = module.security_groups.rds_sg_id
  private_subnet_ids = module.vpc.private_subnet_ids
}
