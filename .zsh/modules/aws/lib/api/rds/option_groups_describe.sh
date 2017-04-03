aws_rds_option_groups_describe() {
    shift 0

    log_and_run aws rds describe-option-groups "$@"
}
