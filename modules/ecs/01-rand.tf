# Allows to change task name every time and avoid conflicts
resource "random_string" "suffix" {
  length  = 32
  special = false

  keepers = {
    cluster = "${var.ecs_cluster_name}"
  }
}
