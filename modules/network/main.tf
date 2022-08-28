#---2-Tier-TCloud/modules/network/main
#---vpc & subnets

resource "aws_vpc" "two_tier_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "2-Tier"
  }
}


resource "aws_subnet" "private_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.region_b
  map_public_ip_on_launch = false

  tags = {
    Name = "2-Tier"
  }
}


resource "aws_subnet" "private_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.region_b
  map_public_ip_on_launch = false

  tags = {
    Name = "2-Tier"
  }
}


resource "aws_subnet" "private_3" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = var.region_b
  map_public_ip_on_launch = false

  tags = {
    Name = "2-Tier"
  }
}


resource "aws_subnet" "public_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = var.region_a
  map_public_ip_on_launch = true

  tags = {
    Name = "2-Tier"
  }
}


resource "aws_subnet" "public_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.5.0/24"
  availability_zone       = var.region_a
  map_public_ip_on_launch = true

  tags = {
    Name = "2-Tier"
  }
}


resource "aws_subnet" "public_3" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.6.0/24"
  availability_zone       = var.region_a
  map_public_ip_on_launch = true

  tags = {
    Name = "2-Tier"
  }
}


resource "aws_internet_gateway" "internet_gw" {
  vpc_id = var.vpc_id

  tags = {
    Name = "2-Tier"
  }
}


resource "aws_eip" "lb_eip" {
  vpc = true
  tags = {
    Name = "2-Tier"
  }
}


resource "aws_lb" "myalb" {
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id]
  security_groups    = [aws_security_group.albsg.id]
  tags = {
    Name = "2-Tier"
  }
}

resource "aws_lb_target_group" "tg" {
  name     = "2-Tier-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  depends_on = [aws_vpc.main]
}