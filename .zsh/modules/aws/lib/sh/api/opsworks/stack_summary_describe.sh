aws_opsworks_stack_summary_describe() {
    local stack_id="$1"
    shift 1

    log_and_run aws opsworks describe-stack-summary --stack-id $stack_id "$@"
}
