aws_cognito-idp_groups_list() {
    local user-pool-id="$1"
    shift 1

    log_and_run aws cognito-idp  --user-pool-id $user_pool_id "@"

}
