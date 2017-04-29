aws_cognito_idp_user_import_job_describe() {
    local user_pool_id="$1"
    local job_id="$2"
    shift 2

    log_and_run aws cognito-idp describe-user-import-job --user-pool-id $user_pool_id --job-id $job_id "$@"
}
