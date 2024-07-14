#!/bin/bash

prompt_user() {
    read -p "Enter MongoDB username: " MONGO_USERNAME
    read -p "Enter MongoDB password: " MONGO_PASSWORD
    read -p "Enter Postgres username: " POSTGRES_USERNAME
    read -p "Enter Postgres password: " POSTGRES_PASSWORD
}

create_secrets() {
    kubectl create secret generic mongodb-secret \
        --from-literal=mongo-username=$MONGO_USERNAME \
        --from-literal=mongo-password=$MONGO_PASSWORD
    kubectl create secret generic postgres-secret \
        --from-literal=postgres-username=$POSTGRES_USERNAME \
        --from-literal=postgres-password=$POSTGRES_PASSWORD
}

# Install K3s
echo "Installing K3s..."
curl -sfL https://get.k3s.io | sh -

# Wait for K3s to be ready
echo "Waiting for K3s to be ready..."
sleep 60

prompt_user

# Create secrets
echo "Creating secrets..."
create_secrets

# Apply Kubernetes manifests
echo "Applying Kubernetes manifests..."

kubectl apply -f nginix.yaml
kubectl apply -f postgres.yaml
kubectl apply -f redis.yaml
kubectl apply -f mongodb.yaml
kubectl apply -f mongo-expres.yaml
kubectl apply -f grafana.yaml