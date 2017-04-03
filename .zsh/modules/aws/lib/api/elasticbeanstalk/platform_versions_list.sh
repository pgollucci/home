aws_elasticbeanstalk_platform_versions_list() {
    shift 0

    log_and_run aws elasticbeanstalk list-platform-versions "$@"
}
