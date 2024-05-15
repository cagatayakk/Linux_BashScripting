# install longhorn

### Create Namespace

```
kubectl create ns longhorn-system
```

## 1- Installing open-iscsi
The open-iscsi package is a prerequisite for Longhorn to create distributed volumes that can be shared across nodes. Ensure that this driver is installed on all worker nodes within your cluster.

```
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.6.0/deploy/prerequisite/longhorn-iscsi-installation.yaml -n longhorn-system
```

After deploying the iSCSI driver, confirm the status of the installer pods using the following command:
```
kubectl get pod -n longhorn-system | grep longhorn-iscsi-installation
```

## 2- Installing NFSv4 client
To enable Longhorn’s backup functionality and ensure proper operation, the NFSv4 client must be installed on the worker nodes within your cluster.

```
kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.6.0/deploy/prerequisite/longhorn-nfs-installation.yaml -n longhorn-system
```

After deploying the NFSv4 client, confirm the status of the installer pods using the following command:

```
kubectl get pod -n longhorn-system | grep longhorn-nfs-installation 
```

## 3- Installing Longhorn

Preparing the configuration value.yaml file:
```
csi:
  kubeletRootDir: "/var/lib/kubelet"
defaultSettings:
  diskType: "flesystem"
```

Install Longhorn in the longhorn-system namespace with configuration above.
```
# 1. added longhorn chart
helm repo add longhorn https://charts.longhorn.io
helm repo update

# 2. Installing
helm install longhorn longhorn/longhorn -f value.yaml -n longhorn-system
```

## Let's make the service type NodePort to access the UI.
```
kubectl patch svc longhorn-frontend -n longhorn-system -p '{"spec": {"type": "NodePort"}}'
```

## Port-Forward for Longhorn UI
```
kubectl port-forward -n longhorn-system service/longhorn-frontend 8080:80
```

## Show in Browser
```
http://127.0.0.1:8080
```



# Example Manifests
```
apiVersion: v1
kind: Pod
metadata:
  name: volume-test
  namespace: default
spec:
  containers:
  - name: volume-test
    image: nginx
    imagePullPolicy: IfNotPresent
    resources: 
    volumeMounts:
    - name: volv
      mountPath: /data
    ports:
    - containerPort: 80
  volumes:
  - name: volv
    persistentVolumeClaim:
      claimName: longhorn-volv-pvc
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: longhorn-volv-pvc
spec:
  accessModes:
    - ReadWriteOnce
  storageClassName: longhorn
  resources:
    requests:
      storage: 2Gi
```