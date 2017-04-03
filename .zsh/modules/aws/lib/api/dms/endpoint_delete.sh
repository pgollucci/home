aws_dms_endpoint_delete() {
    local endpoint_arn="$1"
    shift 1

    cond_log_and_run aws dms delete-endpoint --endpoint-arn $endpoint_arn "$@"
}
