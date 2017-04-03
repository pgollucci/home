aws_opsworks_stack_update() {
    local stack_id="$1"
    shift 1

    cond_log_and_run aws opsworks update-stack --stack-id $stack_id "$@"
}
