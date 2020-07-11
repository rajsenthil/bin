#!/bin/bash

# Enviroment value

username="Senthil Rajendran"
email="rajsenthil@yahoo.com"

if [ -z "$1" ]; then
    echo "git default values set"
else
    read -p "Enter git user name: " username
    read -p "Enter git user email: " email
fi

echo "Settings user name to $username"
echo "and email to $email"

git config user.name "Senthil Rajendran"
git config  user.email "rajsenthil@yahoo.com"
