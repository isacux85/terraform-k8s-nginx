# Proveedor de Kubernetes
provider "kubernetes" {
  config_path = "${pathexpand("~/.kube/config")}" # Ruta del archivo kubeconfig
}

# Crear un namespace (opcional)
resource "kubernetes_namespace" "example_namespace" {
  metadata {
    name = "example-namespace"
  }
}

# Definir el Deployment
resource "kubernetes_deployment" "nginx_deployment" {
  metadata {
    name      = "nginx-deployment"
    namespace = kubernetes_namespace.example_namespace.metadata[0].name
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          image = "nginx:latest"
          name  = "nginx"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# Crear un Service para exponer el Deployment
resource "kubernetes_service" "nginx_service" {
  metadata {
    name      = "nginx-service"
    namespace = kubernetes_namespace.example_namespace.metadata[0].name
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "NodePort"
  }
}
