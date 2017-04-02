aws_storagegateway_cached_iscsi_volume_create() {
    local client-token="$1"
    local target-name="$2"
    local gateway-arn="$3"
    local volume-size-in-bytes="$4"
    local network-interface-id="$5"
    shift 5

    cond_log_and_run aws storagegateway  --client-token $client_token --target-name $target_name --gateway-arn $gateway_arn --volume-size-in-bytes $volume_size_in_bytes --network-interface-id $network_interface_id "@"

}
