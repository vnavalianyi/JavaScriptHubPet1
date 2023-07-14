resource "aws_vpc" "docker-vpc"{
    cidr_block = var.vpc_cidr
    tags = {
        Name: "${var.env_prefix}-vpc"
    }
}

module "docker-subnet" {
  source = "./modules/subnet"
  sub_cidr = var.sub_cidr
  avail_zone = var.avail_zone
  env_prefix = var.env_prefix
  vpc_id = aws_vpc.docker-vpc.id
  default_route_table_id = aws_vpc.docker-vpc.default_route_table_id
}

module "docker-server" {
  source = "./modules/ec2"
  vpc_id = aws_vpc.docker-vpc.id
  my_ip = var.my_ip
  env_prefix = var.env_prefix
  image_name = var.image_name
  ami_owner = var.ami_owner
  key_name = var.key_name
  ansible_ssh_key = var.ansible_ssh_key
  instance_type = var.instance_type
  subnet_id = module.docker-subnet.subnet.id 
  avail_zone = var.avail_zone
  
}