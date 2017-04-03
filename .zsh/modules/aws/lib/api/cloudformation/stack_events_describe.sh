aws_cloudformation_stack_events_describe() {
    shift 0

    log_and_run aws cloudformation describe-stack-events "$@"
}
