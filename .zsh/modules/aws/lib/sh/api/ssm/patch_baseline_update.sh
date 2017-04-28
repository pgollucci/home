aws_ssm_patch_baseline_update() {
    local baseline_id="$1"
    shift 1

    cond_log_and_run aws ssm update-patch-baseline --baseline-id $baseline_id "$@"
}
