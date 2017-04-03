aws_opsworks_instance_update() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws opsworks update-instance --instance-id $instance_id "$@"
}
