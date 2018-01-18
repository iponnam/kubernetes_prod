# Kubernetes Cluster Configuration

########################################################################################################
## Kubernetes Master Initiation

```
sudo kubeadm init --kubernetes-version=v1.8.4
```

#By issuing the above kubeadm init command, it shall configure API Server, ETCD, Controller, & Scheduler components of Kubernetes along with certificates required for bootstrapping Worker Nodes. Once successfully initiated, it will spit out a token and discovery hash for the worker nodes to boot strap. The Token expires in 24 hours and the discovery-token-ca-cert-hash needs to be saved to be able to bootstrap the worker nodes.

*Example: kubeadm join --token 845de7.d621e30286c92936 10.138.0.2:6443 --discovery-token-ca-cert-hash sha256:927cfea2e0e01aefaa7518ed5ead06734213df1afe68f2730f9761d7a0474ea4*

### Following Commands need to executed by the user with which the kubernetes management is to be done.

```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

########################################################################################################
## Kubernetes Worker Node configuration

Command: 
```
sudo kubeadm join --token <token#> --discovery-token-ca-cert-hash <discovery certificate hash>
```
Example:kubeadm join --token 845de7.d621e30286c92936 10.138.0.2:6443 --discovery-token-ca-cert-hash sha256:927cfea2e0e01aefaa7518ed5ead06734213df1afe68f2730f9761d7a0474ea4*
