aws_cognito-idp_user_pools_list() {
    local max-results="$1"
    shift 1

    log_and_run aws cognito-idp  --max-results $max_results "@"

}
