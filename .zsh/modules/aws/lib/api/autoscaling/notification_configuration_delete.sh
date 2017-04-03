aws_autoscaling_notification_configuration_delete() {
    local auto_scaling_group_name="$1"
    local topic_arn="$2"
    shift 2

    cond_log_and_run aws autoscaling delete-notification-configuration --auto-scaling-group-name $auto_scaling_group_name --topic-arn $topic_arn "$@"
}
