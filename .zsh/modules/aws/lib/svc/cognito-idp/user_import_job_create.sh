aws_cognito-idp_user_import_job_create() {
    local user-pool-id="$1"
    local cloud-watch-logs-role-arn="$2"
    local job-name="$3"
    shift 3

    cond_log_and_run aws cognito-idp  --user-pool-id $user_pool_id --cloud-watch-logs-role-arn $cloud_watch_logs_role_arn --job-name $job_name "@"

}
