aws_ssm_activation_delete() {
    local activation_id="$1"
    shift 1

    cond_log_and_run aws ssm delete-activation --activation-id $activation_id "$@"
}
