aws_dms_refresh_schemas_status_describe() {
    local endpoint_arn="$1"
    shift 1

    log_and_run aws dms describe-refresh-schemas-status --endpoint-arn $endpoint_arn "$@"
}
