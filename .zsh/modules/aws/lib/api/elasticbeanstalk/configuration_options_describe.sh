aws_elasticbeanstalk_configuration_options_describe() {
    shift 0

    log_and_run aws elasticbeanstalk describe-configuration-options "$@"
}
