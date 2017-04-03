aws_dms_replication_subnet_groups_describe() {
    shift 0

    log_and_run aws dms describe-replication-subnet-groups "$@"
}
