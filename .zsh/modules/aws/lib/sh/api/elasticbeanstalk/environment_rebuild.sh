aws_elasticbeanstalk_environment_rebuild() {

    cond_log_and_run aws elasticbeanstalk rebuild-environment "$@"
}
