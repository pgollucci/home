aws_cognito_idp_user_import_job_create() {
    local job_name="$1"
    local user_pool_id="$2"
    local cloud_watch_logs_role_arn="$3"
    shift 3

    cond_log_and_run aws cognito-idp create-user-import-job --job-name $job_name --user-pool-id $user_pool_id --cloud-watch-logs-role-arn $cloud_watch_logs_role_arn "$@"
}
