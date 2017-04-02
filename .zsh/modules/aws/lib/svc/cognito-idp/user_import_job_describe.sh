aws_cognito-idp_user_import_job_describe() {
    local user-pool-id="$1"
    local job-id="$2"
    shift 2

    log_and_run aws cognito-idp  --user-pool-id $user_pool_id --job-id $job_id "@"

}
