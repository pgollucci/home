aws_elasticbeanstalk_platform_version_delete() {
    shift 0

    cond_log_and_run aws elasticbeanstalk delete-platform-version "$@"
}
