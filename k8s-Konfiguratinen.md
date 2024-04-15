## Configuration to be added to the bashrc file
```
# k8s settings

export KUBECONFIG=~/.kube/evbc.config:~/.kube/k3s.config
alias k="kubectl"
source <(kubectl completion bash)
source <(helm completion bash)
complete -o default -F __start_kubectl k  # use only k instead of kubectl

# Ende k8s settings
```


## install kubectl
```
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
```

## install helm
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

## install k3s
```
curl -sfL https://get.k3s.io | sh - 
sudo cat /etc/rancher/k3s/k3s.yaml   # check the config file
```

## k3s Konfigürasyon
```
mkdir ~/.kube
sudo cp /etc/rancher/k3s/k3s.yaml ~/.kube/config
Sudo chmod cagatay:cagatay ~/.kube/config
export KUBECONFIG=~/.kube/config
```
