provider "kubernetes" {  
#    minikube = true
#  config_context_cluster   = "minikube"
  host = "${var.kube_host}"
  client_certificate = file("${var.kube_client_certificate}")
  client_key = file("${var.kube_client_key}")
  cluster_ca_certificate = file("${var.kube_cluster_ca_certificate}")
}  

resource "kubernetes_service_v1" "my_service" {
    metadata {
        name = "my-service"
    }

    spec {
        port {
            port = 8000
            target_port = 8000
        }
        
        selector = {
            app = "my-service"
        }
    }
    
}

resource "kubernetes_deployment_v1" "my_deployment" {  
  metadata {  
    name = "my-service"  
    labels = {  
          app = "my-service"  
        } 
  }  
  spec {  
    replicas = 1  
    selector {  
      match_labels = {  
        app = "my-service"  
      }  
    }  
    template {  
      metadata {  
        labels =  {  
          app = "my-service"  
        }  
      }  
      spec {  
        container {  
          name = "my-service"  
          image = "docker.io/library/helloword:latest"  
          image_pull_policy = "Never"
          port {  
            container_port = 8000  
          }  
        }  
      }  
    }  
  }  
}