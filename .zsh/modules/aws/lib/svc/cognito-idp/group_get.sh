aws_cognito-idp_group_get() {
    local user-pool-id="$1"
    local group-name="$2"
    shift 2

    log_and_run aws cognito-idp  --user-pool-id $user_pool_id --group-name $group_name "@"

}
