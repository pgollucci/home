aws_cloudformation_stack_set_delete() {
    local stack_set_name="$1"
    shift 1

    cond_log_and_run aws cloudformation delete-stack-set --stack-set-name $stack_set_name "$@"
}
