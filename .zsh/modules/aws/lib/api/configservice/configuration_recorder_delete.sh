aws_configservice_configuration_recorder_delete() {
    local configuration_recorder_name="$1"
    shift 1

    cond_log_and_run aws configservice delete-configuration-recorder --configuration-recorder-name $configuration_recorder_name "$@"
}
