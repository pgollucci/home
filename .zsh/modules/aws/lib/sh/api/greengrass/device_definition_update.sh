aws_greengrass_device_definition_update() {
    local device_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass update-device-definition --device-definition-id $device_definition_id "$@"
}
