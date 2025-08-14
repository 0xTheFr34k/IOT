#!/bin/bash

SIP=192.168.56.110

ufw disable

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server --node-ip=$SIP --advertise-address=$SIP" sh -s - --token ytaya

sleep 30
