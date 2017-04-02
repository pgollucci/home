aws_apigateway_authorizer_create() {
    local identity-source="$1"
    local type="$2"
    local name="$3"
    local rest-api-id="$4"
    shift 4

    cond_log_and_run aws apigateway  --identity-source $identity_source --type $type --name $name --rest-api-id $rest_api_id "@"

}
