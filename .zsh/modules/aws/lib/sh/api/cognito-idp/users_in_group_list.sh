aws_cognito-idp_users_in_group_list() {
    local user_pool_id="$1"
    local group_name="$2"
    shift 2

    log_and_run aws cognito-idp list-users-in-group --user-pool-id $user_pool_id --group-name $group_name "$@"
}
