aws_ssm_default_patch_baseline_register() {
    local baseline_id="$1"
    shift 1

    cond_log_and_run aws ssm register-default-patch-baseline --baseline-id $baseline_id "$@"
}
