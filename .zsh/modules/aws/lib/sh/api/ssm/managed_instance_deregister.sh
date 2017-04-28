aws_ssm_managed_instance_deregister() {
    local instance_id="$1"
    shift 1

    cond_log_and_run aws ssm deregister-managed-instance --instance-id $instance_id "$@"
}
