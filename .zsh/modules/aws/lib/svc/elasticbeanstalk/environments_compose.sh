aws_elasticbeanstalk_environments_compose() {
    shift 0

    cond_log_and_run aws elasticbeanstalk  "@"

}
