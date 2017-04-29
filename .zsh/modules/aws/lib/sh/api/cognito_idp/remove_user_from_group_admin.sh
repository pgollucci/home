aws_cognito_idp_remove_user_from_group_admin() {
    local user_pool_id="$1"
    local username="$2"
    local group_name="$3"
    shift 3

    cond_log_and_run aws cognito-idp admin-remove-user-from-group --user-pool-id $user_pool_id --username $username --group-name $group_name "$@"
}
