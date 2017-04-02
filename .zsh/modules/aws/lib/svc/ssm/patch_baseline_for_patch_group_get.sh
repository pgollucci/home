aws_ssm_patch_baseline_for_patch_group_get() {
    local patch-group="$1"
    shift 1

    log_and_run aws ssm  --patch-group $patch_group "@"

}
