aws_servicecatalog_record_describe() {
    local id="$1"
    shift 1

    log_and_run aws servicecatalog describe-record --id $id "$@"
}
