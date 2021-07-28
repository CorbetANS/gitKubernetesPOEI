


eval $(minikube docker-env)
docker build -t worker-app ./TPDocker/worker
docker build -t result-app ./TPDocker/result
docker build -t vote-app ./TPDocker/vote

bash ./TPDocker/correction-kubernetes/script.sh