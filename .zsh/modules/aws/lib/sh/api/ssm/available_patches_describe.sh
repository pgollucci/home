aws_ssm_available_patches_describe() {

    log_and_run aws ssm describe-available-patches "$@"
}
