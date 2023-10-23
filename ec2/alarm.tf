resource "aws_cloudwatch_metric_alarm" "instance2_cpu" {
     alarm_name                = "cpu-utilization2"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods        = "2"
     metric_name               = "CPUUtilization"
     namespace                 = "AWS/EC2"
     period                    = "120" #seconds
     statistic                 = "Average"
     threshold                 = "80"
     alarm_description         = "This metric monitors ec2 cpu utilization"
     alarm_actions             = [aws_sns_topic.notify_user1.arn]
     dimensions = {
              InstanceId = aws_instance.my_app[1].id
            }
}

resource "aws_cloudwatch_metric_alarm" "instance2_statuscheck" {
    alarm_name          = "StatusCheck2"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = "2"
    metric_name         = "StatusCheckFailed"
    namespace           = "AWS/EC2"
    period              = "300"
    statistic           = "Maximum"
    threshold           = "1.0"
    alarm_description   = "EC2 Status Check"
    alarm_actions       = [aws_sns_topic.notify_user1.arn]
    dimensions          = {
              InstanceId = aws_instance.my_app[1].id
            }
}

resource "aws_cloudwatch_metric_alarm" "instance1_cpu" {
     alarm_name                = "cpu-utilization1"
     comparison_operator       = "GreaterThanOrEqualToThreshold"
     evaluation_periods        = "2"
     metric_name               = "CPUUtilization"
     namespace                 = "AWS/EC2"
     period                    = "120" #seconds
     statistic                 = "Average"
     threshold                 = "80"
     alarm_description         = "This metric monitors ec2 cpu utilization"
     alarm_actions             = [aws_sns_topic.notify_user1.arn]
     dimensions = {
              InstanceId = aws_instance.my_app[0].id
            }
}

resource "aws_cloudwatch_metric_alarm" "instance1_statuscheck" {
    alarm_name          = "StatusCheck1"
    comparison_operator = "GreaterThanOrEqualToThreshold"
    evaluation_periods  = "2"
    metric_name         = "StatusCheckFailed"
    namespace           = "AWS/EC2"
    period              = "300"
    statistic           = "Maximum"
    threshold           = "1.0"
    alarm_description   = "EC2 Status Check"
    alarm_actions       = [aws_sns_topic.notify_user1.arn]
    dimensions          = {
              InstanceId = aws_instance.my_app[0].id
            }
}