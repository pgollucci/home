aws_autoscaling_notification_configuration_delete() {
    local auto-scaling-group-name="$1"
    local topic-arn="$2"
    shift 2

    cond_log_and_run aws autoscaling  --auto-scaling-group-name $auto_scaling_group_name --topic-arn $topic_arn "@"

}
