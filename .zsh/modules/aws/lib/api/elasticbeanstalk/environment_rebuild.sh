aws_elasticbeanstalk_environment_rebuild() {
    shift 0

    cond_log_and_run aws elasticbeanstalk rebuild-environment "$@"
}
