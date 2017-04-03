aws_opsworks_stacks_describe() {
    shift 0

    log_and_run aws opsworks describe-stacks "$@"
}
