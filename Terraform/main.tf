provider "aws" {
  region = "eu-west-1"
}

module "vpc" {
  source         = "./VPC"
  vpc_cidr_block = "172.160.0.0/16"
}

module "subnet" {
  source         = "./SUBNET"
  vpc_id         = module.vpc.vpc_id
  vpc_cidr_block = module.vpc.vpc_cidr_block
}

module "security_group" {
  source = "./SG"
  vpc_id = module.vpc.vpc_id
}

module "igw" {
  source   = "./IGW"
  vpc_id   = module.vpc.vpc_id
  subnet_1 = module.subnet.subnet_1
  subnet_2 = module.subnet.subnet_2
}

module "manager_node" {
  source                 = "./EC2"
  subnet_id              = module.subnet.subnet_1
  vpc_security_group_ids = [module.security_group.sg_id]
  ami_id                 = var.ami_id
}
