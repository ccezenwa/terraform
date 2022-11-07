terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.37.0"
    }
  }
}

provider "aws" {
  region ="us-east-1"
}

variable "subnet_cidr_block" {
   description = "subnet cidr block"
}

variable "vpc_cidr_block" {
   description = "vpc_cidr_block"
} 
   
   resource "aws_vpc" "develpoment-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name: "development-vpc"
        Terraform: "true"
    }
}
resource "aws_subnet" "dev_subnet-1" {
    vpc_id = aws_vpc.develpoment-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = "us-east-1a"
    tags = { 
        Name: "subnet-1-dev"
        Terraform: "true"
    }
}

output "dev-vpc-id" {
   value = aws_vpc.develpoment-vpc.id   
}

output "dev-subnet-id" {
   value = aws_subnet.dev_subnet-1.id
}
   



