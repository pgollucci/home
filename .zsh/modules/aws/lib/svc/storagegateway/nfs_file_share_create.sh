aws_storagegateway_nfs_file_share_create() {
    local location-arn="$1"
    local client-token="$2"
    local gateway-arn="$3"
    local role="$4"
    shift 4

    cond_log_and_run aws storagegateway  --location-arn $location_arn --client-token $client_token --gateway-arn $gateway_arn --role $role "@"

}
