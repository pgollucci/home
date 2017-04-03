aws_dynamodb_limits_describe() {
    shift 0

    log_and_run aws dynamodb describe-limits "$@"
}
