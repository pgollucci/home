aws_ssm_instance_patch_states_for_patch_group_describe() {
    local patch-group="$1"
    shift 1

    log_and_run aws ssm  --patch-group $patch_group "@"

}
