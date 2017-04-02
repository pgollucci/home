aws_ssm_effective_patches_for_patch_baseline_describe() {
    local baseline-id="$1"
    shift 1

    log_and_run aws ssm  --baseline-id $baseline_id "@"

}
