aws_elasticbeanstalk_environment_cnames_swap() {
    shift 0

    cond_log_and_run aws elasticbeanstalk swap-environment-cnames "$@"
}
