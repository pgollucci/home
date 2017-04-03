aws_s3api_bucket_inventory_configuration_put() {
    local bucket="$1"
    local id="$2"
    local inventory_configuration="$3"
    shift 3

    cond_log_and_run aws s3api put-bucket-inventory-configuration --bucket $bucket --id $id --inventory-configuration $inventory_configuration "$@"
}
