aws_dms_orderable_replication_instances_describe() {
    shift 0

    log_and_run aws dms describe-orderable-replication-instances "$@"
}
