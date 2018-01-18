# Worker Node Certificate Secret Configuration

Request a **.pfx certificate** for the domain that you want to use and use that certificate to generate **__ .pem , .cert & .key __** files required to create a secret

```
openssl pkcs12 -in <__domain.name__>.pfx -nocerts -out privatekey.pem -nodes
openssl pkcs12 -in <__domain.name__>.pfx -nocerts -out <__key_name__>.key
openssl pkcs12 -in <__domain.name__>.pfx -clcerts -nokeys -out <__cert_name__>.cert
openssl rsa -in <__key_name__>.key -out <__key_name__>-unen.key

kubectl create secret tls -n qa <__domain.name__> --key /home/mule_mc/deployments/certs/<__key_name__>-unen.key --cert /home/mule_mc/deployments/certs/<__cert_name__>.cert 
```