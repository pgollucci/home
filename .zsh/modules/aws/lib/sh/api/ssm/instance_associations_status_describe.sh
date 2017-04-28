aws_ssm_instance_associations_status_describe() {
    local instance_id="$1"
    shift 1

    log_and_run aws ssm describe-instance-associations-status --instance-id $instance_id "$@"
}
