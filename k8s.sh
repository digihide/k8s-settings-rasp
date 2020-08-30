# swap off
sudo dphys-swapfile swapoff
sudo dphys-swapfile uninstall
sudo update-rc.d dphys-swapfile remove

sudo apt-get purge -y --auto-remove dphys-swapfile
sudo rm -fr /var/swap
sudo swapoff -a


# docker install
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | sudo apt-key add -

echo "deb [arch=armhf] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
     $(lsb_release -cs) stable" | \
 sudo tee /etc/apt/sources.list.d/docker.list

sudo apt-get -y update
sudo apt-get install -y docker-ce


# k8s install
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kube.list

sudo apt-get update -y 
sudo apt-get install -y kubelet kubeadm kubectl

# upgrade
sudo apt upgrade -y

