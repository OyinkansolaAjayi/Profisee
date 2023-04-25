resource "kubernetes_deployment_v1" "hello" {
  metadata {
    name = "ingress"
    labels = {
      app = kubernetes_service.hello_ingress.metadata.0.name
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = kubernetes_service.hello_ingress.metadata.0.name
      }
    }

    template {
      metadata {
        labels = {
          app = kubernetes_service.hello_ingress.metadata.0.name
        }
      }

      spec {
        container {
          image = "apriltech/helloworld"
          name  = "hello-world"
          port {
            container_port = 80
          }
          env {
            name = "db_name"
            value = "webappdb"
          }
          env {
            name = "db_instance_identifier"
            value = "webappdb"
          }

          env {
            name = "db_port"
            value = "1433"
          }
          
          env {
            name = "db_username"
            value = "admin"
          }
          
          env {
            name = "db_password"
            value = "dbpassword11"
          }

          /*env {
            name = "db_password"
            value_from {
              secret_key_ref {
                name = "basic-auth"
                key = "db_password"
              }
            }
          }

          env {
            name = "db_username"
            value_from {
              secret_key_ref {
                name = "basic-auth"
                key = "db_username"
              }
            }
          }*/
        }
      }
    }
  }
}