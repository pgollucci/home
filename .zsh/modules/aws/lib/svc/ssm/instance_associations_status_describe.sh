aws_ssm_instance_associations_status_describe() {
    local instance-id="$1"
    shift 1

    log_and_run aws ssm  --instance-id $instance_id "@"

}
