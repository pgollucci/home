aws_ssm_default_patch_baseline_get() {

    log_and_run aws ssm get-default-patch-baseline "$@"
}
