aws_elasticbeanstalk_environment_terminate() {
    shift 0

    cond_log_and_run aws elasticbeanstalk terminate-environment "$@"
}
