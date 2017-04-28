aws_dms_endpoint_modify() {
    local endpoint_arn="$1"
    shift 1

    cond_log_and_run aws dms modify-endpoint --endpoint-arn $endpoint_arn "$@"
}
