aws_cognito_idp_user_attribute_verify() {
    local access_token="$1"
    local attribute_name="$2"
    local code="$3"
    shift 3

    cond_log_and_run aws cognito-idp verify-user-attribute --access-token $access_token --attribute-name $attribute_name --code $code "$@"
}
