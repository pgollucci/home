aws_elasticbeanstalk_applications_describe() {
    shift 0

    log_and_run aws elasticbeanstalk describe-applications "$@"
}
