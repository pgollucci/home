aws_opsworks_stack_delete() {
    local stack_id="$1"
    shift 1

    cond_log_and_run aws opsworks delete-stack --stack-id $stack_id "$@"
}
