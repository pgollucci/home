aws_ssm_default_patch_baseline_get() {
    shift 0

    log_and_run aws ssm get-default-patch-baseline "$@"
}
