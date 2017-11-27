
#The cfssl and cfssljson command line utilities will be used to provision a PKI Infrastructure and generate TLS certificates
wget -q --show-progress --https-only --timestamping \
  https://pkg.cfssl.org/R1.2/cfssl_linux-amd64 \
  https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
  
chmod +x cfssl_linux-amd64 cfssljson_linux-amd64
sudo mv cfssl_linux-amd64 /usr/local/bin/cfssl

sudo mv cfssljson_linux-amd64 /usr/local/bin/cfssljson

#verification of cfssl
cfssl version

# Configure KubeCtl
wget https://storage.googleapis.com/kubernetes-release/release/v1.8.0/bin/linux/amd64/kubectl

chmod +x kubectl

sudo mv kubectl /usr/local/bin/

#Verify the kubectl version

kubectl version --client

# Firewall rules
firewall rule that allows internal communication across all protocols


#Generate the CA certificate and private key:

cfssl gencert -initca ca-csr.json | cfssljson -bare ca

#Generate client and server certificates for each Kubernetes component and a client certificate for the Kubernetes admin user

#For the admin user:
cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -profile=kubernetes \
  admin-csr.json | cfssljson -bare admin

#For each kubernetes Worker Node

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=k8s-poc,35.200.142.61,10.160.0.3 \
  -profile=kubernetes \
  k8-pocs-csr.json | cfssljson -bare k8s-poc
done
