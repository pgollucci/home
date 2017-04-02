aws_ssm_patch_baseline_get() {
    local baseline-id="$1"
    shift 1

    log_and_run aws ssm  --baseline-id $baseline_id "@"

}
