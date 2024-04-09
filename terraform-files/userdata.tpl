#!/bin/bash

# Update Ubuntu repositories
echo "Updating Ubuntu repositories..."
sudo apt update

# Upgrade existing packages
echo "Upgrading existing packages..."
sudo apt upgrade -y

# Install dependencies to allow apt to use a repository over HTTPS
echo "Installing dependencies..."
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Add Docker's official GPG key
echo "Adding Docker's GPG key..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository
echo "Setting up Docker repository..."
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Add Kubernetes apt repository
echo "Adding Kubernetes apt repository..."
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null

# Update the apt package index again
echo "Updating apt package index..."
sudo apt update

# Install Docker engine
echo "Installing Docker..."
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Check Docker version
echo "Docker version:"
docker --version

# Install Kubernetes components
echo "Installing Kubernetes components..."
sudo apt install -y kubelet kubeadm kubectl

# Hold Kubernetes components at their current version to prevent automatic upgrades
sudo apt-mark hold kubelet kubeadm kubectl

# Check Kubernetes version
echo "Kubernetes version:"
kubectl version --short

# Add current user to the docker group to run Docker commands without sudo
echo "Adding current user to the docker group..."
sudo usermod -aG docker $USER

# Prompt to logout for group changes to take effect
echo "Please logout and login again for Docker group changes to take effect."

# Finish
echo "Installation completed."
