# Missing /sys because it fails no matter what I try to do
resource "aws_ecs_task_definition" "cadvisor" {
  family                = "cadvisor"
  container_definitions = "${file("${path.module}/task-definitions/cadvisor.json")}"

  volume {
    name      = "root"
    host_path = "/"
  }

  volume {
    name      = "var_run"
    host_path = "/var/run"
  }

  volume {
    name      = "var_lib_docker"
    host_path = "/var/lib/docker/"
  }

  volume {
    name      = "dev_disk"
    host_path = "/dev/disk/"
  }

  volume {
    name      = "cgroup"
    host_path = "/cgroup/"
  }

  volume {
    name      = "sys"
    host_path = "/sys/"
  }
}
