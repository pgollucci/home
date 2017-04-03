aws_cloudformation_exports_list() {
    shift 0

    log_and_run aws cloudformation list-exports "$@"
}
