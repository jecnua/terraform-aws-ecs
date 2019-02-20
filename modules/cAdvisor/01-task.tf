# Allows to change task name every time and avoid conflicts
resource "random_string" "suffix" {
  length  = 32
  special = false #

  keepers = {
    cluster = "${var.cluster_id}"
  }
}

resource "aws_ecs_task_definition" "cadvisor" {
  family                = "cadvisor-${random_string.suffix.result}"
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
