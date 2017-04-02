aws_cognito-idp_csv_header_get() {
    local user-pool-id="$1"
    shift 1

    log_and_run aws cognito-idp  --user-pool-id $user_pool_id "@"

}
