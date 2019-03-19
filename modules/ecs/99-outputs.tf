output "ecs_cluster_arn" {
  description = "The ECS cluster arn"
  value       = "${aws_ecs_cluster.ecs_cluster.id}"
}

output "ecs_cluster_name" {
  description = "The ECS cluster name"
  value       = "${aws_ecs_cluster.ecs_cluster.name}"
}
