aws_ssm_instance_patch_states_describe() {
    local instance-ids="$1"
    shift 1

    log_and_run aws ssm  --instance-ids $instance_ids "@"

}
