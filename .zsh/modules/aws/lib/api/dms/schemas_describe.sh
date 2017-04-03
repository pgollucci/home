aws_dms_schemas_describe() {
    local endpoint_arn="$1"
    shift 1

    log_and_run aws dms describe-schemas --endpoint-arn $endpoint_arn "$@"
}
