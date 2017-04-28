aws_opsworks_instance_deregister() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws opsworks deregister-instance --instance-id $instance_id "$@"
}
