resource "aws_sns_topic" "notify_user" {
  name = "notify-user-topic"
}

resource "aws_sns_topic_subscription" "notify_user_sns_target" {
  topic_arn = aws_sns_topic.notify_user.arn
  protocol  = "email"
  endpoint  = "ashokcbe2015@gmail.com"
}