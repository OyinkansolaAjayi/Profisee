resource "kubernetes_service" "sql_svc" {
  metadata {
    name = "sql-server"
  }
  spec {

    type = "ExternalName"
    external_name = "webappdb.c2j6eoywwtuf.us-east-1.rds.amazonaws.com"
  }
}