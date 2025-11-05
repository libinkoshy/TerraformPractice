terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.5.0"
}
provider "aws" {
  region = "us-east-2"
}
module "vpc" {
  source = "./modules/vpc"

  vpc_name = "demo-vpc"
  vpc_cidr = "10.0.0.0/16"

  azs = ["us-east-2a", "us-east-2b"]

  public_subnets = {
    public-1 = "10.0.1.0/24"
    public-2 = "10.0.2.0/24"
  }

  private_subnets = {
    private-1 = "10.0.3.0/24"
    private-2 = "10.0.4.0/24"
  }

  tags = {
    Environment = "dev"
    Owner       = "Libin"
  }
}

module "ec2" {
  source = "./modules/ec2"

  ami_id              = "ami-077b630ef539aa0b5"   
  instance_type       = "t3.micro"
  subnet_id           = module.vpc.public_subnet_ids[0]
  key_name            = "libin-linux"
  instance_name       = "demo-ec2"
  associate_public_ip = true
}

module "sg_alb" {
  source       = "./modules/sg"
  name         = "alb"
  vpc_id       = module.vpc.vpc_id
  allowed_cidrs = ["0.0.0.0/0"]
}

module "sg_asg" {
  source       = "./modules/sg"
  name         = "asg"
  vpc_id       = module.vpc.vpc_id
  allowed_cidrs = ["0.0.0.0/0"]
}

module "asg" {
  source             = "./modules/asg"
  name               = "webapp"
  ami_id              = "ami-077b630ef539aa0b5"   
  instance_type      = "t3.micro"
  subnet_ids         = module.vpc.private_subnet_ids
  security_group_ids = [module.sg_alb.sg_id]
  target_group_arns  = [module.alb.target_group_arn]
}

module "alb" {
  source             = "./modules/alb"
  name               = "webapp"
  vpc_id             = module.vpc.vpc_id
  subnet_ids         = module.vpc.public_subnet_ids
  security_group_ids = [module.sg_alb.sg_id]
}

module "s3_bucket" {
  source            = "./modules/s3"
  bucket_name       = "my-terraform-s3-bucket-demo"
  versioning_enabled = true
  tags = {
    Environment = "dev"
    Project     = "terraform-demo"
  }
}