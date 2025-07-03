# Projeto_terraform_3
Projeto pessoal de infraestrutura como código utilizando Terraform para provisionar e gerenciar recursos na AWS.
Este repositório contém exemplos e módulos básicos para automatizar a criação de serviços na nuvem, facilitando a reprodutibilidade e o aprendizado de boas práticas em DevOps e infraestrutura na AWS.

## Como encontrar a AMI do Debian
Para obter o ID da AMI do Debian 12 na região sa-east-1, você pode usar o seguinte comando no terminal:
aws ec2 describe-images --filters "Name=name,Values=debian-12-amd64-*" --region sa-east-1

## Gerando uma chave SSH Ed25519
Para criar um novo par de chaves SSH utilizando o algoritmo Ed25519 (recomendado por ser mais seguro e eficiente que RSA), execute o seguinte comando no terminal:
ssh-keygen -t ed25519

## Obtendo o IP público da instância EC2 com Terraform
Para descobrir o endereço IP público da sua instância EC2 já provisionada, utilize o comando abaixo no terminal:
terraform state show <nome_do_recurso>

## Conectando-se à instância EC2 via SSH
Após a instância EC2 ser provisionada e a chave SSH estar registrada na AWS, você pode se conectar a ela utilizando o seguinte comando no seu terminal:
ssh -i ~/.ssh/id_ed25519 admin@<IP_PÚBLICO_DA_INSTANCIA>

## Automatizando a conexão SSH (Configuração no ~/.ssh/config)
Para simplificar a conexão SSH com a sua instância EC2, você pode adicionar uma entrada no seu arquivo de configuração SSH (`~/.ssh/config`). Isso permite que você se conecte usando um alias curto, sem precisar digitar o IP completo e o caminho da chave a cada vez.
Execute o seguinte script no seu terminal **após o `terraform apply`**:
```bash
# Define um alias para a conexão SSH
HOST_ALIAS="meu-servidor" # Você pode mudar este nome
# Obtém o IP público da instância usando o output do Terraform
HOSTNAME=$(terraform output -raw public_ip)
# Define o usuário SSH e o caminho da chave privada
USER="admin"
IDENTITY_FILE="$HOME/.ssh/id_ed25519"
# Adiciona a configuração ao arquivo ~/.ssh/config
cat << EOF >> ~/.ssh/config
Host ${HOST_ALIAS}
    HostName ${HOSTNAME}
    User ${USER}
    IdentityFile ${IDENTITY_FILE}
EOF
echo "Configuração SSH adicionada! Agora você pode conectar com: ssh ${HOST_ALIAS}"