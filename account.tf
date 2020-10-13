resource "aws_vpc" "challenge_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "false"

  tags = {
    Name = "Challenge"
    Company = "Momentum"
  }
}

resource "aws_subnet" "challenge_subnet1" {
  vpc_id     = aws_vpc.challenge_vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.subnet1_region
  tags = {
    Name = "ChallengeSubnet1"
    Company = "Momentum"
  }
}

resource "aws_subnet" "challenge_subnet2" {
  vpc_id     = aws_vpc.challenge_vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = var.subnet2_region
  tags = {
    Name = "ChallengeSubnet2"
    Company = "Momentum"
  }
}