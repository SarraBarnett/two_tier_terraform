#!/bin/bash

# Update the system
sudo yum update -y

# Install Apache
sudo yum install httpd -y

# Start and enable Apache
sudo systemctl start httpd
sudo systemctl enable httpd