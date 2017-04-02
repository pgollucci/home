aws_apigateway_method_put() {
    local http-method="$1"
    local authorization-type="$2"
    local rest-api-id="$3"
    local resource-id="$4"
    shift 4

    cond_log_and_run aws apigateway  --http-method $http_method --authorization-type $authorization_type --rest-api-id $rest_api_id --resource-id $resource_id "@"

}
