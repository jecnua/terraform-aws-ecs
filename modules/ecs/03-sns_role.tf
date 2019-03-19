data "aws_iam_policy_document" "sns_topic_policy" {
  policy_id = "ecs-stream-events-to-sns-${random_string.suffix.result}"

  statement {
    effect = "Allow"
    sid    = "ecs-stream-events-to-sns-${random_string.suffix.result}"

    actions = [
      "SNS:Subscribe",
      "SNS:SetTopicAttributes",
      "SNS:RemovePermission",
      "SNS:Receive",
      "SNS:Publish",
      "SNS:ListSubscriptionsByTopic",
      "SNS:GetTopicAttributes",
      "SNS:DeleteTopic",
      "SNS:AddPermission",
    ]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }

    principals {
      type        = "Service"
      identifiers = ["events.amazonaws.com"] # Allow cloudwatch to push
    }

    resources = [
      "${aws_sns_topic.ecs_event_stream_sns.arn}",
    ]
  }
}
