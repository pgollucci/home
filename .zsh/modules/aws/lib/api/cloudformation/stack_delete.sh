aws_cloudformation_stack_delete() {
    local stack_name="$1"
    shift 1

    cond_log_and_run aws cloudformation delete-stack --stack-name $stack_name "$@"
}
