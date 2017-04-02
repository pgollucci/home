aws_sns_endpoint_delete() {
    local endpoint-arn="$1"
    shift 1

    cond_log_and_run aws sns  --endpoint-arn $endpoint_arn "@"

}
