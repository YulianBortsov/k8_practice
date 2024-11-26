#!/bin/bash
kubectl create configmap wordpress-config --from-literal=WORDPRESS_DB_HOST='mysql-clusterip.backend.svc.cluster.local' --from-literal=WORDPRESS_DB_NAME='wordpressdb' --from-literal=WORDPRESS_DB_USER='wordpressUser' --namespace=frontend
kubectl create secret generic wordpress-secrets --from-literal=WORDPRESS_DB_PASSWORD='wordpresspass' --namespace=frontend
kubectl create configmap mysql-config --from-literal=MYSQL_DATABASE='wordpressdb' --from-literal=MYSQL_USER='wordpressUser' --namespace=backend
kubectl create secret generic mysql-secrets --from-literal=MYSQL_ROOT_PASSWORD='root' --from-literal=MYSQL_PASSWORD='wordpresspass' --namespace=backend