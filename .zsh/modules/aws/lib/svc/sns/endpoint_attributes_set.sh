aws_sns_endpoint_attributes_set() {
    local endpoint-arn="$1"
    local attributes="$2"
    shift 2

    cond_log_and_run aws sns  --endpoint-arn $endpoint_arn --attributes $attributes "@"

}
