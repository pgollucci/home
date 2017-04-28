aws_opsworks_instance_start() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws opsworks start-instance --instance-id $instance_id "$@"
}
