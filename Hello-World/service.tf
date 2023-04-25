resource "kubernetes_service" "helloworldsvc" {
  metadata {
    name = "hello-svc"
  }
  spec {
    selector = {
      app = "hello"
    }
    port {
      port        = 80
      target_port = 80
    }

    type = "LoadBalancer"
  }
}