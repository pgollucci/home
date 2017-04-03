aws_apigateway_documentation_part_create() {
    local rest_api_id="$1"
    local location="$2"
    local properties="$3"
    shift 3

    cond_log_and_run aws apigateway create-documentation-part --rest-api-id $rest_api_id --location $location --properties $properties "$@"
}
