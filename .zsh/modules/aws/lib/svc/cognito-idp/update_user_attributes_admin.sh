aws_cognito-idp_update_user_attributes_admin() {
    local user-attributes="$1"
    local user-pool-id="$2"
    local username="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --user-attributes $user_attributes --user-pool-id $user_pool_id --username $username "@"

}
