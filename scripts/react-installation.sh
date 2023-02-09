#!/bin/bash

sudo yum update -y

echo "Installing NodeJS"
sudo yum install -y gcc-c++ make git
curl -sL https://rpm.nodesource.com/setup_16.x | sudo -E bash -
sudo yum install nodejs -y

echo "Installing daemon process manager that will help manage and keep the reactApp online 24/7"
sudo npm install pm2 -g

echo "Clonning the React project and installing dependencies"
git clone -b react-b https://github.com/hothaifa96/node-october.git
cd node-october/counters-app
npm i package.json

echo "Excuteing the React project"
pm2 --name reactApp start npm -- start
