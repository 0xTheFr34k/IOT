#!/bin/bash
set -e

SIP=192.168.56.112

systemctl disable firewalld --now

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip=$SIP --advertise-address=$SIP" sh -s -

sleep 30
