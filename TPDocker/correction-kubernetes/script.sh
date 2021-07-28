#!/bin/bash

# eval $(minikube docker-env)
# docker build -t worker-app ../worker
# docker build -t result-app ../result
# docker build -t vote-app ../vote
#Création du namespace
kubectl create namespace global-vote-app
#Création des deployments
deployments=("deployment-redis.yml","deployment-vote-app.yml","deployment-result-app.yml","deployment-worker-app.yml","deployment-postgres.yml") 
for e in $deployments
do
    # echo $e
    kubectl create -f ${e}
done 

#Création de services
services=("service-postgres.yml","service-redis.yml","service-vote.yml","service-result.yml")
for s in  $services
do 
    # echo $s
    kubectl create -f ${s}
done 
# minikube service result -n=global-vote-app
# minikube service vote -n=global-vote-app