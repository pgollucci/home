aws_opsworks_app_update() {
    local app-id="$1"
    shift 1

    cond_log_and_run aws opsworks  --app-id $app_id "@"

}
