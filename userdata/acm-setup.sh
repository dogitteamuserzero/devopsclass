#!/bin/bash
# Java + Maven + Git
sudo apt update
sudo apt install openjdk-8-jdk -y
sudo apt install ca-certificates -y
sudo apt install maven git wget unzip -y

# Ansible
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

# Docker + Docker Compose
wget -O - https://get.docker.com | bash

