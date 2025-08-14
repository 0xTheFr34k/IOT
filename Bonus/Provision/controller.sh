#!/bin/bash

sudo ufw disable

sudo apt update -y && sudo apt upgrade -y
sudo apt install -y curl openssh-server ca-certificates tzdata perl
sudo systemctl enable --now ssh
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="https://192.168.56.110" apt install -y gitlab-ce
sudo gitlab-ctl reconfigure
sudo cat /etc/gitlab/initial_root_password
