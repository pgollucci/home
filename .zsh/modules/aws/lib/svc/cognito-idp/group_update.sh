aws_cognito-idp_group_update() {
    local group-name="$1"
    local user-pool-id="$2"
    shift 2

    cond_log_and_run aws cognito-idp  --group-name $group_name --user-pool-id $user_pool_id "@"

}
