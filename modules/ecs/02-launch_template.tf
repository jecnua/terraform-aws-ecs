data "aws_ami" "ami_dynamic" {
  most_recent = true
  owners      = ["${var.ami_owner}"] # Canonical

  filter {
    name   = "name"
    values = ["${var.ami_name_filter_regex}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  name_regex = "${var.ami_name_regex}"
}

resource "aws_security_group" "my_ami_sg" {
  name        = "sdafgvsaidguydsafuydfsa"
  vpc_id      = "vpc-b7c690d2"
  description = "Security group for masters"

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }

  # outbound internet access
  # allowed: any egress traffic to anywhere
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

# resource "aws_launch_template" "ecs_launch_template" {
#   name                                 = "${var.ecs_cluster_name}-${random_string.suffix.result}-lt"
#   description                          = ""
#   disable_api_termination              = true
#   ebs_optimized                        = false
#   image_id                             = "${data.aws_ami.ami_dynamic.id}"
#   instance_initiated_shutdown_behavior = "terminate"
#   instance_type                        = "t3.medium"
#
#   # kernel_id                            = "test"
#   # key_name                             = "test"
#   # ram_disk_id = "test"
#
#   vpc_security_group_ids = [
#     "${aws_security_group.my_ami_sg.id}",
#   ]
#
#   # iam_instance_profile                 = ""
#
#
#   # user_data = "${base64encode(...)}"
#
#   block_device_mappings {
#     device_name = "/dev/sda1"
#
#     ebs {
#       volume_size = 20
#     }
#   }
#   # capacity_reservation_specification {
#   #   capacity_reservation_preference = "open"
#   # }
#   credit_specification {
#     cpu_credits = "unlimited"
#   }
#   # elastic_gpu_specifications {
#   #   type = "test"
#   # }
#   # iam_instance_profile {
#   #   name = "test"
#   # }
#   instance_market_options {
#     market_type = "spot"
#   }
#   # license_specification {
#   #   license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
#   # }
#   monitoring {
#     enabled = true
#   }
#   network_interfaces {
#     associate_public_ip_address = true
#   }
#   # placement {
#   #   availability_zone = "us-west-2a"
#   # }
#   tag_specifications {
#     resource_type = "instance"
#
#     tags = {
#       Name = "test"
#     }
#   }
# }

resource "aws_launch_template" "ecs_launch_template_2" {
  name        = "${var.ecs_cluster_name}-${random_string.suffix.result}-lt-2"
  description = ""
  image_id    = "${data.aws_ami.ami_dynamic.id}"
}
