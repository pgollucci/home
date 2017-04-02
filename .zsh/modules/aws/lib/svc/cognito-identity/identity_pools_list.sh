aws_cognito-identity_identity_pools_list() {
    local max-results="$1"
    shift 1

    log_and_run aws cognito-identity  --max-results $max_results "@"

}
