aws_opsworks_instance_unassign() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws opsworks unassign-instance --instance-id $instance_id "$@"
}
