#!/bin/bash

MASTER_IP=192.168.56.110
WIP=192.168.56.111

ufw disable

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://$MASTER_IP:6443 --token ytaya --node-ip=$WIP" sh -s -
