aws_cognito-idp_user_attributes_delete() {
    local user-attribute-names="$1"
    shift 1

    cond_log_and_run aws cognito-idp  --user-attribute-names $user_attribute_names "@"

}
