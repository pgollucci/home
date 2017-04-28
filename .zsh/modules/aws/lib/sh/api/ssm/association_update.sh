aws_ssm_association_update() {
    local association_id="$1"
    shift 1

    cond_log_and_run aws ssm update-association --association-id $association_id "$@"
}
