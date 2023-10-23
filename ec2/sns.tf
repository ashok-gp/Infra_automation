resource "aws_sns_topic" "notify_user1" {
  name = "notify-user-topic1"
}

resource "aws_sns_topic_subscription" "notify_user_sns_target" {
  topic_arn = aws_sns_topic.notify_user1.arn
  protocol  = "email"
  endpoint  = "ashokcbe2015@gmail.com"
}