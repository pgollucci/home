aws_ssm_association_status_update() {
    local name="$1"
    local association-status="$2"
    local instance-id="$3"
    shift 3

    cond_log_and_run aws ssm  --name $name --association-status $association_status --instance-id $instance_id "@"

}
