aws_elasticbeanstalk_application_versions_describe() {
    shift 0

    log_and_run aws elasticbeanstalk describe-application-versions "$@"
}
