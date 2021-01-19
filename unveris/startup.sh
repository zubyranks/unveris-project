#!/bin/bash
yum update -y 
yum install httpd -y  
service httpd start
systemctl enable httpd
echo "Part 1 is complete and Part 2 will involve running a playbook that will clone a git_url containing an index page and clone to /var/www/html" >/var/www/html/index.html
yum install python3-pip -y 
yum install ansible -y   


