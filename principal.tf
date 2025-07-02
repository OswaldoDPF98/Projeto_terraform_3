resource "aws_vpc" "padrao" {
    cidr_block = "10.123.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true

    tags = {
      Name = "VPC Padrao"
    }
}

resource "aws_subnet" "subred_publica" {
  vpc_id = aws_vpc.padrao.id
    cidr_block = "10.123.1.0/24"
    map_public_ip_on_launch = true
    availability_zone = "sa-east-1a"

    tags = {
      Name = "Subred Publica"
    }
}