resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.ecs_cluster_name}-${random_string.suffix.result}"
}
