aws_greengrass_device_definition_delete() {
    local device_definition_id="$1"
    shift 1

    cond_log_and_run aws greengrass delete-device-definition --device-definition-id $device_definition_id "$@"
}
