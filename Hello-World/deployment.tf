resource "kubernetes_deployment_v1" "hello-world" {
  metadata {
    name = "helloworld"
    labels = {
      app = "hello"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "hello"
      }
    }

    template {
      metadata {
        labels = {
          app = "hello"
        }
      }

      spec {
        container {
          image = "apriltech/helloworld"
          name  = "hello-world"
          port {
            container_port = 80
          }

          
        }
      }
    }
  }
}