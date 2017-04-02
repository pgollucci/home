aws_cognito-idp_user_pool_create() {
    local pool-name="$1"
    shift 1

    cond_log_and_run aws cognito-idp  --pool-name $pool_name "@"

}
