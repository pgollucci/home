aws_autoscaling_scaling_activities_describe() {
    shift 0

    log_and_run aws autoscaling describe-scaling-activities "$@"
}
