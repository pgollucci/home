aws_apigateway_method_put() {
    local rest_api_id="$1"
    local resource_id="$2"
    local http_method="$3"
    local authorization_type="$4"
    shift 4

    cond_log_and_run aws apigateway put-method --rest-api-id $rest_api_id --resource-id $resource_id --http-method $http_method --authorization-type $authorization_type "$@"
}
