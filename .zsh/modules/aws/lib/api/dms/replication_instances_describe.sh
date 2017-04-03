aws_dms_replication_instances_describe() {
    shift 0

    log_and_run aws dms describe-replication-instances "$@"
}
