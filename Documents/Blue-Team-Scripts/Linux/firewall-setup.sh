#!/bin/bash
# Basic Linux firewall setup with UFW

sudo ufw --force reset
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
# sudo ufw allow 3306/tcp   # Uncomment if MySQL needed
sudo ufw --force enable
sudo ufw status verbose
