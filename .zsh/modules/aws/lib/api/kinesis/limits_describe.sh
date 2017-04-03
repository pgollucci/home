aws_kinesis_limits_describe() {
    shift 0

    log_and_run aws kinesis describe-limits "$@"
}
