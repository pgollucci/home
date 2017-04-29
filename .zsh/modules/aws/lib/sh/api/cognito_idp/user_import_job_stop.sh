aws_cognito_idp_user_import_job_stop() {
    local user_pool_id="$1"
    local job_id="$2"
    shift 2

    cond_log_and_run aws cognito-idp stop-user-import-job --user-pool-id $user_pool_id --job-id $job_id "$@"
}
