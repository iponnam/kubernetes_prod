# Kubernetes Binary Package Installations

**Commands:***
```
wget -q -O - https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo sh -c 'echo deb http://apt.kubernetes.io/ kubernetes-xenial main > /etc/apt/sources.list.d/kubernetes.list'
sudo apt-get update
sudo apt-get install -y kubernetes-cni=0.5.1-00
sudo apt-get install -y kubelet=1.8.4-00
sudo apt-get install -y kubectl=1.8.4-00
sudo apt-get install -y kubeadm=1.8.4-00
```