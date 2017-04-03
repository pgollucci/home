aws_ssm_available_patches_describe() {
    shift 0

    log_and_run aws ssm describe-available-patches "$@"
}
