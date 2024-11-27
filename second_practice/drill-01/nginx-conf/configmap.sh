#!/bin/bash
kubectl create configmap myappv1-config --from-file=default.conf=myappv1-nginx.conf
kubectl create configmap myappv2-config --from-file=default.conf=myappv2-nginx.conf
kubectl create configmap myappv3-config --from-file=default.conf=myappv3-nginx.conf
