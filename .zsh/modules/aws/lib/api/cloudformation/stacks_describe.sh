aws_cloudformation_stacks_describe() {
    shift 0

    log_and_run aws cloudformation describe-stacks "$@"
}
