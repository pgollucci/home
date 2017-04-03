aws_cognito-identity_identity_pools_list() {
    local max_results="$1"
    shift 1

    log_and_run aws cognito-identity list-identity-pools --max-results $max_results "$@"
}
