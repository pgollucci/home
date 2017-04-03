aws_opsworks_ssl() {
        local app_id="$1"
        shift 1

    cond_log_and_run aws opsworks update-app --app-id $app_id --enable-ssl "$@"
}

