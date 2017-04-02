aws_ssm_association_update() {
    local association-id="$1"
    shift 1

    cond_log_and_run aws ssm  --association-id $association_id "@"

}
