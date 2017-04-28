aws_sns_endpoint_delete() {
    local endpoint_arn="$1"
    shift 1

    cond_log_and_run aws sns delete-endpoint --endpoint-arn $endpoint_arn "$@"
}
