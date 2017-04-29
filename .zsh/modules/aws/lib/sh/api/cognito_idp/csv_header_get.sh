aws_cognito_idp_csv_header_get() {
    local user_pool_id="$1"
    shift 1

    log_and_run aws cognito-idp get-csv-header --user-pool-id $user_pool_id "$@"
}
