# Adiciona a configuração ao arquivo SSH
cat << EOF >> ~/.ssh/config

Host ${HOSTNAME}
    HostName ${HOSTNAME}
    User ${USER}
    IdentityFile ${IDENTITY_FILE}
EOF

echo "Configuração SSH adicionada! Agora você pode conectar com: ssh ${HOSTNAME}"