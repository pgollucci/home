aws_storagegateway_stored_iscsi_volume_create() {
    local gateway_arn="$1"
    local disk_id="$2"
    local preserve_existing_data="$3"
    local target_name="$4"
    local network_interface_id="$5"
    shift 5

    cond_log_and_run aws storagegateway create-stored-iscsi-volume --gateway-arn $gateway_arn --disk-id $disk_id --preserve-existing-data $preserve_existing_data --target-name $target_name --network-interface-id $network_interface_id "$@"
}
