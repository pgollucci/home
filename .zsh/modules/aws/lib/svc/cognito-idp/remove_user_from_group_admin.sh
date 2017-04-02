aws_cognito-idp_remove_user_from_group_admin() {
    local group-name="$1"
    local username="$2"
    local user-pool-id="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --group-name $group_name --username $username --user-pool-id $user_pool_id "@"

}
