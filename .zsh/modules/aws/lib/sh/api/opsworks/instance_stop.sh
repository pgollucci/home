aws_opsworks_instance_stop() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws opsworks stop-instance --instance-id $instance_id "$@"
}
