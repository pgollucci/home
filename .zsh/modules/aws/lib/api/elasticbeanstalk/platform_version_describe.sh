aws_elasticbeanstalk_platform_version_describe() {
    shift 0

    log_and_run aws elasticbeanstalk describe-platform-version "$@"
}
