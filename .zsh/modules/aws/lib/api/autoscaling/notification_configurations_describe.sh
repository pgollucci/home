aws_autoscaling_notification_configurations_describe() {
    shift 0

    log_and_run aws autoscaling describe-notification-configurations "$@"
}
