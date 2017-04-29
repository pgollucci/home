aws_cognito_idp_user_pools_list() {
    local max_results="$1"
    shift 1

    log_and_run aws cognito-idp list-user-pools --max-results $max_results "$@"
}
