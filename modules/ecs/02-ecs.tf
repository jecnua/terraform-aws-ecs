resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.ecs_cluster_name}-${random_string.suffix.result}"
}

# resource "aws_ec2_fleet" "ecs_cluster_fleet" {
#   type                        = "maintain"
#   replace_unhealthy_instances = true
#   terminate_instances         = true
#
#   launch_template_config {
#     launch_template_specification {
#       launch_template_id = "${aws_launch_template.ecs_launch_template_2.id}"
#       version            = "${aws_launch_template.ecs_launch_template_2.latest_version}"
#     }
#
#     override {
#       instance_type     = "t3.medium"
#       weighted_capacity = 1
#       subnet_id         = "subnet-"
#     }
#   }
#
#   target_capacity_specification {
#     default_target_capacity_type = "spot"
#     on_demand_target_capacity    = 0
#     spot_target_capacity         = 5
#     total_target_capacity        = 5
#   }
# }

