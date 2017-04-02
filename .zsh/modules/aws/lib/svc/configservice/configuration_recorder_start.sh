aws_configservice_configuration_recorder_start() {
    local configuration-recorder-name="$1"
    shift 1

    cond_log_and_run aws configservice  --configuration-recorder-name $configuration_recorder_name "@"

}
