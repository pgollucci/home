aws_opsworks_instance_reboot() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws opsworks reboot-instance --instance-id $instance_id "$@"
}
