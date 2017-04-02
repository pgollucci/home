aws_opsworks_instance_unassign() {
    local instance-id="$1"
    shift 1

    cond_log_and_run aws opsworks  --instance-id $instance_id "@"

}
