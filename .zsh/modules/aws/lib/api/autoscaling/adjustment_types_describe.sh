aws_autoscaling_adjustment_types_describe() {
    shift 0

    log_and_run aws autoscaling describe-adjustment-types "$@"
}
