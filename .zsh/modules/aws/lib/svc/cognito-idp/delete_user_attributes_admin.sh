aws_cognito-idp_delete_user_attributes_admin() {
    local username="$1"
    local user-attribute-names="$2"
    local user-pool-id="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --username $username --user-attribute-names $user_attribute_names --user-pool-id $user_pool_id "@"

}
