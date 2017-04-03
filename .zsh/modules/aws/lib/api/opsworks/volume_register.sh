aws_opsworks_volume_register() {
    local stack_id="$1"
    shift 1

    cond_log_and_run aws opsworks register-volume --stack-id $stack_id "$@"
}
