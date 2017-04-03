aws_autoscaling_auto_scaling_notification_types_describe() {
    shift 0

    log_and_run aws autoscaling describe-auto-scaling-notification-types "$@"
}
