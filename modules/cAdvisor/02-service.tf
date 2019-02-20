resource "aws_ecs_service" "cadvisor" {
  name                = "cadvisor-${random_string.suffix.result}"
  cluster             = "${var.cluster_id}"
  task_definition     = "${aws_ecs_task_definition.cadvisor.arn}"
  scheduling_strategy = "DAEMON"
}
