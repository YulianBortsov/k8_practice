#!/bin/bash
openssl req -x509 -newkey rsa:4096 -keyout cert.key -out cert.crt -days 365 -nodes -subj "/CN=myapp.example.com"

kubectl create secret tls myapp-tls-secret --cert=cert.crt --key=cert.key
