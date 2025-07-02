resource "aws_vpc" "padrao" {
  cidr_block           = "10.123.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "VPC Padrao"
  }
}

resource "aws_subnet" "subred_publica" {
  vpc_id                  = aws_vpc.padrao.id
  cidr_block              = "10.123.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "sa-east-1a"

  tags = {
    Name = "Subred Publica"
  }
}

resource "aws_internet_gateway" "gateway_de_internet" {
  vpc_id = aws_vpc.padrao.id

  tags = {
    Name = "Gateway de Internet"
  }
}

resource "aws_route_table" "tabla_de_ruta" {
  vpc_id = aws_vpc.padrao.id

  tags = {
    Name = "Tabla de ruta pública   "
  }
}

resource "aws_route" "ruta" {
  route_table_id = aws_route_table.tabla_de_ruta.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gateway_de_internet.id
}