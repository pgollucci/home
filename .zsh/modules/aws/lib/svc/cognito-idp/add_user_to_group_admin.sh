aws_cognito-idp_add_user_to_group_admin() {
    local username="$1"
    local user-pool-id="$2"
    local group-name="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --username $username --user-pool-id $user_pool_id --group-name $group_name "@"

}
