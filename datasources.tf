# Este bloco busca automaticamente a AMI mais recente do Debian 12 (x86_64) na região sa-east-1.
# Para encontrar o ID manualmente, você pode usar no terminal o seguinte comando:
# aws ec2 describe-images --filters "Name=name,Values=debian-12-amd64-*" --region sa-east-1

data "aws_ami" "debian" {
  most_recent = true
  owners      = ["136693071363"] # Owner ID oficial de Debian

  filter {
    name   = "name"
    values = ["debian-12-amd64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}