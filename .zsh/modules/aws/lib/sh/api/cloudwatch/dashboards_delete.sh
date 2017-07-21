aws_cloudwatch_dashboards_delete() {

    cond_log_and_run aws cloudwatch delete-dashboards "$@"
}
