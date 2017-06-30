aws_cognito_idp_user_attributes_delete() {
    local user_attribute_names="$1"
    local access_token="$2"
    shift 2

    cond_log_and_run aws cognito-idp delete-user-attributes --user-attribute-names $user_attribute_names --access-token $access_token "$@"
}
