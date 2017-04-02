aws_ssm_patch_baseline_create() {
    local name="$1"
    shift 1

    cond_log_and_run aws ssm  --name $name "@"

}
