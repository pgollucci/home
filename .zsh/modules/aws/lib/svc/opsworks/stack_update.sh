aws_opsworks_stack_update() {
    local stack-id="$1"
    shift 1

    cond_log_and_run aws opsworks  --stack-id $stack_id "@"

}
