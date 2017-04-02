aws_s3api_bucket_inventory_configurations_list() {
    local bucket="$1"
    shift 1

    log_and_run aws s3api  --bucket $bucket "@"

}
