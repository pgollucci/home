aws_cognito-idp_user_pool_create() {
    local pool_name="$1"
    shift 1

    cond_log_and_run aws cognito-idp create-user-pool --pool-name $pool_name "$@"
}
