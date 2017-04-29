aws_cognito_idp_user_attribute_verify() {
    local attribute_name="$1"
    local code="$2"
    shift 2

    cond_log_and_run aws cognito-idp verify-user-attribute --attribute-name $attribute_name --code $code "$@"
}
