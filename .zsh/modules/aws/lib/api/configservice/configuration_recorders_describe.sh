aws_configservice_configuration_recorders_describe() {
    shift 0

    log_and_run aws configservice describe-configuration-recorders "$@"
}
