# Application Environment: Creation and Deployment

## Deployment of State-ful pod with application container

**Command:**
```
echo "
apiVersion: apps/v1beta2
kind: StatefulSet
metadata:
  name: <appName>
  namespace: $nameSpace
spec:
  selector:
    matchLabels:
      app: <appName>
  serviceName: <appName>
  replicas: <# of pods> 
  template:
    metadata:
      labels:
        app: <appName>
    spec:
      terminationGracePeriodSeconds: 5
      containers:
      - name: <appName>
        image: <Image_Info>
        ports:
        - containerPort: <portNum>
        volumeMounts:
        - mountPath: /Path/on/Container/<vol-01>
          name: <vol-01>
        - mountPath: /Path/on/Container/<vol-02>
          name: <vol-02>
      volumes:
      - name: <vol-01>
        hostPath:
         path: /Path/on/Host/<vol-01>/
         type: DirectoryOrCreate
      - name: <vol-02>
        hostPath:
         path: /Path/on/Host/<vol-02>/
         type: DirectoryOrCreate
" | kubectl apply -f -
```

## Kubernetes Service Creation to route the traffic to the container based on the selector

```
echo "
apiVersion: v1
kind: Service
metadata:
  name: <project>
  namespace: <nameSpace>
spec:
  type: NodePort
  ports:
  - port: <container portNum>
    targetPort: <portNum>
    protocol: TCP
  selector:
    app: <project>
" | kubectl apply -f -
```

