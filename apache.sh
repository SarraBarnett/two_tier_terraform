#!/bin/bash

# Update the package repository
yum update -y

# Install Nginx
yum install nginx -y

# Start Nginx
systemctl start nginx

# Enable Nginx to start on boot
systemctl enable nginx

# Open the firewall to allow HTTP traffic
firewall-cmd --permanent --add-service=http
firewall-cmd --reload

# Create a test page to verify the installation
echo "Welcome to my Nginx server!" > /usr/share/nginx/html/index.html