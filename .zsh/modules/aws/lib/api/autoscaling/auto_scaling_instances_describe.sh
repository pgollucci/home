aws_autoscaling_auto_scaling_instances_describe() {
    shift 0

    log_and_run aws autoscaling describe-auto-scaling-instances "$@"
}
