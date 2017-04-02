aws_cognito-idp_user_attribute_verification_code_get() {
    local attribute-name="$1"
    shift 1

    log_and_run aws cognito-idp  --attribute-name $attribute_name "@"

}
