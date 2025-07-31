#!/bin/bash
set -e

systemctl disable firewalld --now

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token ytaya --node-ip=192.168.56.111 --flannel-iface eth1" sh -s -
