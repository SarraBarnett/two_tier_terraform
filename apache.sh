#!/bin/bash

# Update the package repository
apt-get update

# Install Nginx
apt-get install nginx -y

# Start Nginx
systemctl start nginx

# Enable Nginx to start on boot
systemctl enable nginx

# Open the firewall to allow HTTP traffic
ufw allow 'Nginx HTTP'

# Create a test page to verify the installation
echo "Welcome to my Nginx server!" > /var/www/html/index.html