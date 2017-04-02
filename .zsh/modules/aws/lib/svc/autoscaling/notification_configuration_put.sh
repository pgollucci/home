aws_autoscaling_notification_configuration_put() {
    local topic-arn="$1"
    local notification-types="$2"
    local auto-scaling-group-name="$3"
    shift 3

    cond_log_and_run aws autoscaling  --topic-arn $topic_arn --notification-types $notification_types --auto-scaling-group-name $auto_scaling_group_name "@"

}
