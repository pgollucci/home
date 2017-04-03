aws_servicecatalog_record_history_list() {
    shift 0

    log_and_run aws servicecatalog list-record-history "$@"
}
