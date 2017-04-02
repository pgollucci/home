aws_cloudformation_update_stack_cancel() {
    local stack-name="$1"
    shift 1

    cond_log_and_run aws cloudformation  --stack-name $stack_name "@"

}
