# k8s settings

export KUBECONFIG=~/.kube/evbc.config:~/.kube/k3s.config
alias k="kubectl"
source <(kubectl completion bash)
source <(helm completion bash)
complete -o default -F __start_kubectl k

# Ende k8s settings
