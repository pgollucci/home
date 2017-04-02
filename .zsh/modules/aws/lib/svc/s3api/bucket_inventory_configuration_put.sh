aws_s3api_bucket_inventory_configuration_put() {
    local id="$1"
    local inventory-configuration="$2"
    local bucket="$3"
    shift 3

    cond_log_and_run aws s3api  --id $id --inventory-configuration $inventory_configuration --bucket $bucket "@"

}
