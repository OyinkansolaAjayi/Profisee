resource "kubernetes_secret" "rds_sc" {
  metadata {
    name = "basic-auth"
  }

  data = {
    db_username = "dbadmin"
    db_password = "dbpassword11"
  }

}