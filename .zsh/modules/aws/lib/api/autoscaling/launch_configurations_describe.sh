aws_autoscaling_launch_configurations_describe() {
    shift 0

    log_and_run aws autoscaling describe-launch-configurations "$@"
}
