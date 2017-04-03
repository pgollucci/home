aws_elasticbeanstalk_app_server_restart() {
    shift 0

    cond_log_and_run aws elasticbeanstalk restart-app-server "$@"
}
