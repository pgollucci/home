aws_cognito-idp_user_import_jobs_list() {
    local user_pool_id="$1"
    local max_results="$2"
    shift 2

    log_and_run aws cognito-idp list-user-import-jobs --user-pool-id $user_pool_id --max-results $max_results "$@"
}
