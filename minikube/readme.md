# terraform in practice

## minikube

### How to get information of k8s
user `kubectl config vie` to check service IP of k8s

### How to log for terraform
enable 

```shell
export TF_LOG="DEBUG"
```

disable

```shell
unset TF_LOG
```

### using local image

```shell
eval $(minikube -p minikube docker-env)
```


## deployment 

```shell
cd minikube/iac
terraform apply
```

## destroy
```shell
terraform destroy
```