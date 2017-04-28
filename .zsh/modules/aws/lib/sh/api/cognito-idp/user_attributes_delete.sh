aws_cognito-idp_user_attributes_delete() {
    local user_attribute_names="$1"
    shift 1

    cond_log_and_run aws cognito-idp delete-user-attributes --user-attribute-names $user_attribute_names "$@"
}
