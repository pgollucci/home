aws_storagegateway_vtl_device_type_update() {
    local vtl-device-arn="$1"
    local device-type="$2"
    shift 2

    cond_log_and_run aws storagegateway  --vtl-device-arn $vtl_device_arn --device-type $device_type "@"

}
