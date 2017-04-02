aws_s3api_bucket_analytics_configuration_put() {
    local analytics-configuration="$1"
    local bucket="$2"
    local id="$3"
    shift 3

    cond_log_and_run aws s3api  --analytics-configuration $analytics_configuration --bucket $bucket --id $id "@"

}
