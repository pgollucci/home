aws_elasticbeanstalk_environments_compose() {

    cond_log_and_run aws elasticbeanstalk compose-environments "$@"
}
