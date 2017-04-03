aws_ssm_patch_baseline_delete() {
    local baseline_id="$1"
    shift 1

    cond_log_and_run aws ssm delete-patch-baseline --baseline-id $baseline_id "$@"
}
