#!/bin/bash

# Cập nhật và cài nginx
sudo apt-get update -y
sudo apt-get install nginx -y
sudo service nginx start

#Link template
web1="https://weblium.com/templates/demo/carsharing-website-design-275"
web2="https://weblium.com/templates/demo/car-rental-website-design-216"
web3="https://weblium.com/templates/demo/car-leasing-company-website-design-110"

# Tạo file tạm
sudo touch temp.html

# check hostname và tải template
host=$(hostname)

if [ "$host" == "first" ]; then
    wget -qO temp.html "$web1"
elif [ "$host" == "second" ]; then
    wget -qO temp.html "$web2"
elif [ "$host" == "third" ]; then
    wget -qO temp.html "$web3"
else
    echo "Hostname không hợp lệ: $host"
    exit 1
fi

sudo cp -f temp.html /usr/share/nginx/html/index.html

# Restart nginx
sudo service nginx restart