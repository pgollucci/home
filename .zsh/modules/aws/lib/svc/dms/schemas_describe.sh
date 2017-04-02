aws_dms_schemas_describe() {
    local endpoint-arn="$1"
    shift 1

    log_and_run aws dms  --endpoint-arn $endpoint_arn "@"

}
