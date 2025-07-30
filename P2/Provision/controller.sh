#!/bin/bash
set -e

systemctl disable firewalld --now

SIP=192.168.56.110

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip=$SIP --advertise-address=$SIP" sh -s - --token ytaya

cp /usr/local/bin/kubectl /usr/sbin/kubectl
