#!/bin/bash

# Enviroment value
stty -echo; read -p "Enter Jasypt environment value: " jasypt; stty echo; echo

JASYPT_ENCRYPTOR_PASSWORD=$jasypt
