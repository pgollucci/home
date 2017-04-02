aws_ssm_patch_group_state_describe() {
    local patch-group="$1"
    shift 1

    log_and_run aws ssm  --patch-group $patch_group "@"

}
