#!/bin/bash
set -e

systemctl disable firewalld --now

# sudo dnf update -y && sudo dnf upgrade -y
sudo dnf update -y
sudo dnf install -y curl openssh-server policycoreutils python3-policycoreutils postfix
sudo systemctl enable --now sshd
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
sudo EXTERNAL_URL="https://192.168.56.110" dnf install -y gitlab-ce
sudo gitlab-ctl reconfigure
sudo cat /etc/gitlab/initial_root_password
