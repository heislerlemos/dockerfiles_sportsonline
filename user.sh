#!/bin/sh
echo "Verificanção de utilizador"

if id -u ubuntu  > /dev/null 2>&1; then 
    echo "utilizador ja foi criado"
else 
      useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1001 ubuntu

fi
