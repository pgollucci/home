aws_s3api_bucket_analytics_configuration_get() {
    local id="$1"
    local bucket="$2"
    shift 2

    log_and_run aws s3api  --id $id --bucket $bucket "@"

}
