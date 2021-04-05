kubectl create namespace production
kubectl create -f mongodb-service.yml
kubectl create -f mongodb-pod.yml
kubectl create -f backend-service.yml
kubectl create -f backend-deployment.yml
kubectl create -f front-end-service.yml
kubectl create -f front-end-deployment.yml
