aws_ssm_default_patch_baseline_register() {
    local baseline-id="$1"
    shift 1

    cond_log_and_run aws ssm  --baseline-id $baseline_id "@"

}
