#!/bin/bash
set -e

systemctl disable firewalld --now

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip=192.168.56.110  --flannel-iface eth1 --token ytaya" sh -s -

cp /usr/local/bin/kubectl /usr/sbin/kubectl
