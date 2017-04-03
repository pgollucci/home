aws_elasticbeanstalk_environments_describe() {
    shift 0

    log_and_run aws elasticbeanstalk describe-environments "$@"
}
