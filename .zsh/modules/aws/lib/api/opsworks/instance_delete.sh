aws_opsworks_instance_delete() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws opsworks delete-instance --instance-id $instance_id "$@"
}
