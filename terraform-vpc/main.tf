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