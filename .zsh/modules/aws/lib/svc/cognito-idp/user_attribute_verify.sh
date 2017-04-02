aws_cognito-idp_user_attribute_verify() {
    local attribute-name="$1"
    local code="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --attribute-name $attribute_name --code $code "@"

}
