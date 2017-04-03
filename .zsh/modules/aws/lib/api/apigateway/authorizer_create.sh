aws_apigateway_authorizer_create() {
    local rest_api_id="$1"
    local name="$2"
    local type="$3"
    local identity_source="$4"
    shift 4

    cond_log_and_run aws apigateway create-authorizer --rest-api-id $rest_api_id --name $name --type $type --identity-source $identity_source "$@"
}
