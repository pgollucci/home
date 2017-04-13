aws_elasticbeanstalk_app_server_restart() {

    cond_log_and_run aws elasticbeanstalk restart-app-server "$@"
}
