variable "kube_host" {
    description = "host of k8s"
    type = string
}
variable "kube_client_certificate" {
    description = "certificate"
    type = string
}
variable "kube_client_key" {
    description = "client key"
    type = string
}

variable "kube_cluster_ca_certificate" {
    description = "cluster ca"
    type = string
}

