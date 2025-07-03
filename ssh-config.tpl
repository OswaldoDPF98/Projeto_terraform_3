# Obtém o IP público da instância usando o output do Terraform
HOST_ALIAS="meu-servidor"
HOSTNAME=$(terraform output -raw public_ip)
USER="admin"
IDENTITY_FILE="$HOME/.ssh/id_ed25519"

# Adiciona a configuração ao arquivo SSH
cat << EOF >> ~/.ssh/config

Host ${HOST_ALIAS}
    HostName ${HOSTNAME}
    User ${USER}
    IdentityFile ${IDENTITY_FILE}
EOF

echo "Configuração SSH adicionada! Agora você pode conectar com: ssh ${HOST_ALIAS}"