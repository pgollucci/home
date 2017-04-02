aws_ssm_activation_delete() {
    local activation-id="$1"
    shift 1

    cond_log_and_run aws ssm  --activation-id $activation_id "@"

}
