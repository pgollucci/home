aws_greengrass_device_definition_versions_list() {
    local device_definition_id="$1"
    shift 1

    log_and_run aws greengrass list-device-definition-versions --device-definition-id $device_definition_id "$@"
}
