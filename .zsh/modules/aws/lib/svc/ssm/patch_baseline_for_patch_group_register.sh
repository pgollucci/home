aws_ssm_patch_baseline_for_patch_group_register() {
    local patch-group="$1"
    local baseline-id="$2"
    shift 2

    cond_log_and_run aws ssm  --patch-group $patch_group --baseline-id $baseline_id "@"

}
