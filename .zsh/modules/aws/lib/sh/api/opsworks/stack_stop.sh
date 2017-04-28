aws_opsworks_stack_stop() {
    local stack_id="$1"
    shift 1

    cond_log_and_run aws opsworks stop-stack --stack-id $stack_id "$@"
}
