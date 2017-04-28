aws_cloudformation_update_rollback_continue() {
    local stack_name="$1"
    shift 1

    cond_log_and_run aws cloudformation continue-update-rollback --stack-name $stack_name "$@"
}
