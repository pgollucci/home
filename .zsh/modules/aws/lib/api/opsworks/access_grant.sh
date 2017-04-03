aws_opsworks_access_grant() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws opsworks grant-access --instance-id $instance_id "$@"
}
