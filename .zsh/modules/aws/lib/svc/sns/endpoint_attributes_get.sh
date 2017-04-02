aws_sns_endpoint_attributes_get() {
    local endpoint-arn="$1"
    shift 1

    log_and_run aws sns  --endpoint-arn $endpoint_arn "@"

}
