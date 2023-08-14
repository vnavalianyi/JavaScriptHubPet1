#!/bin/bash
sudo apt update -y && sudo apt upgrade -y
sudo curl -fsSL https://get.docker.com -o install-docker.sh | sh
sudo systemctl start docker
sudo usermod -aG docker ubuntu
 