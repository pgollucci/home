aws_greengrass_device_definition_get() {
    local device_definition_id="$1"
    shift 1

    log_and_run aws greengrass get-device-definition --device-definition-id $device_definition_id "$@"
}
