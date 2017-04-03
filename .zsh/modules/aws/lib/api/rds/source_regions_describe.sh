aws_rds_source_regions_describe() {
    shift 0

    log_and_run aws rds describe-source-regions "$@"
}
