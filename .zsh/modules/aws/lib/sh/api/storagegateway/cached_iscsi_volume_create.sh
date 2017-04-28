aws_storagegateway_cached_iscsi_volume_create() {
    local gateway_arn="$1"
    local volume_size_in_bytes="$2"
    local target_name="$3"
    local network_interface_id="$4"
    local client_token="$5"
    shift 5

    cond_log_and_run aws storagegateway create-cached-iscsi-volume --gateway-arn $gateway_arn --volume-size-in-bytes $volume_size_in_bytes --target-name $target_name --network-interface-id $network_interface_id --client-token $client_token "$@"
}
