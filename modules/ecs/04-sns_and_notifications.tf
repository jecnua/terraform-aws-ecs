resource "aws_sns_topic" "ecs_event_stream_sns" {
  name = "${var.ecs_event_stream_sns_topic_name}-${random_string.suffix.result}"
}

resource "aws_cloudwatch_event_rule" "ecs_event_stream" {
  name        = "${var.ecs_event_stream_sns_topic_name}-${random_string.suffix.result}"
  description = "Event logs for ${var.ecs_cluster_name}"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.ecs"
  ],
  "detail": {
    "clusterArn": ["${aws_ecs_cluster.ecs_cluster.arn}"]
  }
}
PATTERN
}

resource "aws_cloudwatch_event_target" "ecs_event_stream" {
  rule = "${aws_cloudwatch_event_rule.ecs_event_stream.name}"
  arn  = "${aws_sns_topic.ecs_event_stream_sns.arn}"
}

resource "aws_sns_topic_policy" "default" {
  arn    = "${aws_sns_topic.ecs_event_stream_sns.arn}"
  policy = "${data.aws_iam_policy_document.sns_topic_policy.json}"
}
