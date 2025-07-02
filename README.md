# Projeto_terraform_3
Projeto pessoal de infraestrutura como código utilizando Terraform para provisionar e gerenciar recursos na AWS.
Este repositório contém exemplos e módulos básicos para automatizar a criação de serviços na nuvem, facilitando a reprodutibilidade e o aprendizado de boas práticas em DevOps e infraestrutura na AWS.

## Como encontrar a AMI do Debian
Para obter o ID da AMI do Debian 12 na região sa-east-1, você pode usar o seguinte comando no terminal:
aws ec2 describe-images --filters "Name=name,Values=debian-12-amd64-*" --region sa-east-1