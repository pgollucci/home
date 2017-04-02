aws_apigateway_documentation_part_create() {
    local properties="$1"
    local location="$2"
    local rest-api-id="$3"
    shift 3

    cond_log_and_run aws apigateway  --properties $properties --location $location --rest-api-id $rest_api_id "@"

}
