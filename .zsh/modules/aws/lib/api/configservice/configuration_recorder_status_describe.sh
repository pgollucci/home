aws_configservice_configuration_recorder_status_describe() {
    shift 0

    log_and_run aws configservice describe-configuration-recorder-status "$@"
}
