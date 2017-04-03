aws_autoscaling_lifecycle_hook_types_describe() {
    shift 0

    log_and_run aws autoscaling describe-lifecycle-hook-types "$@"
}
