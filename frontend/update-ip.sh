#!/bin/bash

API_URL="http://169.254.169.254/latest/meta-data"
TOKEN=$(curl -X PUT "$API_URL/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 600")
TOKEN_HEADER="X-aws-ec2-metadata-token: $TOKEN"
METADATA_URL="http://169.254.169.254/latest/meta-data"
IP_V4=$(curl -H "$TOKEN_HEADER" -s $METADATA_URL/public-ipv4)

sudo sed -i "s|http://__BACKEND_IP__:3000|http://$IP_V4:3000|g" /home/ubuntu/app/frontend/nginx.conf
sudo sed -i "s|http://localhost:3000|http://$IP_V4:3000|g" /home/ubuntu/app/frontend/index.html

echo "Updated IP address in index.html and nginx.conf to $IP_V4"
