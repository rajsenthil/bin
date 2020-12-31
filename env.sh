#!/bin/bash

# Enviroment value
stty -echo; read -p "Enter Jasypt environment value: " jasypt; stty echo; echo

export JASYPT_ENCRYPTOR_PASSWORD=$jasypt
