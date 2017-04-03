aws_s3api_bucket_inventory_configuration_delete() {
    local bucket="$1"
    local id="$2"
    shift 2

    cond_log_and_run aws s3api delete-bucket-inventory-configuration --bucket $bucket --id $id "$@"
}
