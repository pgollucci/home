aws_cloudformation_update_rollback_continue() {
    local stack-name="$1"
    shift 1

    cond_log_and_run aws cloudformation  --stack-name $stack_name "@"

}
