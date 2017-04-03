aws_elbv2_target_groups_describe() {
    shift 0

    log_and_run aws elbv2 describe-target-groups "$@"
}
