aws_cognito-idp_list_groups_for_user_admin() {
    local username="$1"
    local user-pool-id="$2"
    shift 2

    log_and_run aws cognito-idp  --username $username --user-pool-id $user_pool_id "@"

}
