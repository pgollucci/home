aws_s3api_bucket_analytics_configuration_put() {
    local bucket="$1"
    local id="$2"
    local analytics_configuration="$3"
    shift 3

    cond_log_and_run aws s3api put-bucket-analytics-configuration --bucket $bucket --id $id --analytics-configuration $analytics_configuration "$@"
}
