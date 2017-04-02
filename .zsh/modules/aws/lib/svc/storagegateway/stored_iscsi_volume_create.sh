aws_storagegateway_stored_iscsi_volume_create() {
    local gateway-arn="$1"
    local disk-id="$2"
    local target-name="$3"
    local preserve-existing-data="$4"
    local network-interface-id="$5"
    shift 5

    cond_log_and_run aws storagegateway  --gateway-arn $gateway_arn --disk-id $disk_id --target-name $target_name --preserve-existing-data $preserve_existing_data --network-interface-id $network_interface_id "@"

}
