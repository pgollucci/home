aws_ssm_association_status_update() {
    local name="$1"
    local instance_id="$2"
    local association_status="$3"
    shift 3

    cond_log_and_run aws ssm update-association-status --name $name --instance-id $instance_id --association-status $association_status "$@"
}
