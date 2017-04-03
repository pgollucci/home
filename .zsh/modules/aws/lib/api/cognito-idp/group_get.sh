aws_cognito-idp_group_get() {
    local group_name="$1"
    local user_pool_id="$2"
    shift 2

    log_and_run aws cognito-idp get-group --group-name $group_name --user-pool-id $user_pool_id "$@"
}
