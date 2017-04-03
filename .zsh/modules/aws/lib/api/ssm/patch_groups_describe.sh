aws_ssm_patch_groups_describe() {
    shift 0

    log_and_run aws ssm describe-patch-groups "$@"
}
