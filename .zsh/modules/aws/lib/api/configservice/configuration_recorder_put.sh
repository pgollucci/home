aws_configservice_configuration_recorder_put() {
    local configuration_recorder="$1"
    shift 1

    cond_log_and_run aws configservice put-configuration-recorder --configuration-recorder $configuration_recorder "$@"
}
