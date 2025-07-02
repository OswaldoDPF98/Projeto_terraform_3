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

resource "aws_route_table" "tabela_de_rota" {
  vpc_id = aws_vpc.padrao.id

  tags = {
    Name = "Tabela de rota pública   "
  }
}

resource "aws_route" "rota" {
  route_table_id = aws_route_table.tabela_de_rota.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gateway_de_internet.id
}

resource "aws_route_table_association" "asociacao_publica" {
  subnet_id = aws_subnet.subred_publica.id
  route_table_id = aws_route_table.tabela_de_rota.id
}

resource "aws_security_group" "grupo_de_seguranca" {
  name = "Grupo de seguranca"
  description = "Grupo de seguranca"
  vpc_id = aws_vpc.padrao.id

  ingress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "autorizacao" {
  key_name = "chave-ssh"
    public_key = file("~/.ssh/id_ed25519.pub") # Altere o caminho para o arquivo da sua chave pública SSH
}