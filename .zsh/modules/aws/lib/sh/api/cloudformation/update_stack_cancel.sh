aws_cloudformation_update_stack_cancel() {
    local stack_name="$1"
    shift 1

    cond_log_and_run aws cloudformation cancel-update-stack --stack-name $stack_name "$@"
}
