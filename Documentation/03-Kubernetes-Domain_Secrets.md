# Worker Node Certificate Secret Configuration

Request a **.pfx certificate** for the domain that you want to use and use that certificate to generate **_ .pem , .cert & .key _** files required to create a secret

```
openssl pkcs12 -in <domain.name>.pfx -nocerts -out privatekey.pem -nodes
openssl pkcs12 -in <domain.name>.pfx -nocerts -out <key_name>.key
openssl pkcs12 -in <domain.name>.pfx -clcerts -nokeys -out <cert_name>.cert
openssl rsa -in <key_name>.key -out <key_name>-unen.key

kubectl create secret tls -n qa <domain.name> --key /home/mule_mc/deployments/certs/<key_name>-unen.key --cert /home/mule_mc/deployments/certs/<cert_name>.cert 
```