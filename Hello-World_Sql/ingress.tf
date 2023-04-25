resource "kubernetes_service" "hello_ingress" {
  metadata {
    name = "ingress"
  }
  spec {
    port {
      port        = 80
      target_port = 80
      protocol    = "TCP"
    }
    type = "NodePort"
  }
}

resource "kubernetes_ingress" "hello_ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "ingress"
    annotations = {
      "kubernetes.io/ingress.class" = "nginx"
    }
  }
  spec {
    rule {
      host = "apriltech.com/hello"
      http {
        path {
          path = "/*"
          backend {
            service_name = kubernetes_service.hello_ingress.metadata.0.name
            service_port = 80
          }
        }
      }
    }
  }
}