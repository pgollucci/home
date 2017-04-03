aws_elbv2_rules_describe() {
    shift 0

    log_and_run aws elbv2 describe-rules "$@"
}
