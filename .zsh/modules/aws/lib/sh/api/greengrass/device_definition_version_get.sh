aws_greengrass_device_definition_version_get() {
    local device_definition_id="$1"
    local device_definition_version_id="$2"
    shift 2

    log_and_run aws greengrass get-device-definition-version --device-definition-id $device_definition_id --device-definition-version-id $device_definition_version_id "$@"
}
