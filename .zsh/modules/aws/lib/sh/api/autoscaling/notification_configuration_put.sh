aws_autoscaling_notification_configuration_put() {
    local auto_scaling_group_name="$1"
    local topic_arn="$2"
    local notification_types="$3"
    shift 3

    cond_log_and_run aws autoscaling put-notification-configuration --auto-scaling-group-name $auto_scaling_group_name --topic-arn $topic_arn --notification-types $notification_types "$@"
}
