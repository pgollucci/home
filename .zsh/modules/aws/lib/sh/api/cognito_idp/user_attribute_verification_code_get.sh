aws_cognito_idp_user_attribute_verification_code_get() {
    local attribute_name="$1"
    shift 1

    log_and_run aws cognito-idp get-user-attribute-verification-code --attribute-name $attribute_name "$@"
}
