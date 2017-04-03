aws_s3api_bucket_analytics_configuration_get() {
    local bucket="$1"
    local id="$2"
    shift 2

    log_and_run aws s3api get-bucket-analytics-configuration --bucket $bucket --id $id "$@"
}
