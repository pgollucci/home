aws_configservice_configuration_recorder_put() {
    local configuration-recorder="$1"
    shift 1

    cond_log_and_run aws configservice  --configuration-recorder $configuration_recorder "@"

}
