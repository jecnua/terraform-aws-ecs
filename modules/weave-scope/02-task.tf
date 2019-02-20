resource "aws_ecs_task_definition" "weave_scope" {
  family                = "weave-scope-${random_string.suffix.result}"
  container_definitions = "${file("${path.module}/task-definitions/weave-scope.json")}"

  volume {
    name      = "docker_sock"
    host_path = "/var/run/docker.sock"
  }
}
