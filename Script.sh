#!/bin/bash 
sudo yum update -y
amazon-linux-extras install nginx1 -y
systemctl enable nginx
systemctl start nginx

##############################################

"echo 'Hello from the remote instance'",
"sudo yum update", # Update package list for linux.
"sudo yum install -y python3-pip", # Package installation.
"cd /tmp/script.sh",
"sudo pip3 install flask",
"sudo python3 script.sh",


