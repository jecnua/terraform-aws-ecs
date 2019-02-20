# The monitoring tool will be installed as a DAEMON unless you specify a list
# of at least one EC2 server. In this second case the number of container
# will be equal to the number of IDs passed.

resource "aws_ecs_service" "weave-scope-daemon" {
  count               = "${length(var.instances_id) == 0 ? 1 : 0}"
  name                = "weave-scope-daemon-${random_string.suffix.result}"
  cluster             = "${var.cluster_id}"
  task_definition     = "${aws_ecs_task_definition.weave_scope.arn}"
  scheduling_strategy = "DAEMON"
}

resource "aws_ecs_service" "weave-scope-single" {
  count           = "${signum(length(var.instances_id))}"
  name            = "weave-scope-single-${random_string.suffix.result}"
  cluster         = "${var.cluster_id}"
  task_definition = "${aws_ecs_task_definition.weave_scope.arn}"
  desired_count   = "${length(var.instances_id)}"

  ordered_placement_strategy {
    type  = "spread"
    field = "instanceId"
  }

  placement_constraints {
    type       = "memberOf"
    expression = "ec2InstanceId in ['${join(",",var.instances_id)}']"
  }
}
