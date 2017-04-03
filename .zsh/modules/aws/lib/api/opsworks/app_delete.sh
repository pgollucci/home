aws_opsworks_app_delete() {
    local app_id="$1"
    shift 1

    cond_log_and_run aws opsworks delete-app --app-id $app_id "$@"
}
