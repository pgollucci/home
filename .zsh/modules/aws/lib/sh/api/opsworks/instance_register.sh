aws_opsworks_instance_register() {
    local stack_id="$1"
    shift 1

    cond_log_and_run aws opsworks register-instance --stack-id $stack_id "$@"
}
