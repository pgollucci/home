aws_ssm_patch_baseline_delete() {
    local baseline-id="$1"
    shift 1

    cond_log_and_run aws ssm  --baseline-id $baseline_id "@"

}
