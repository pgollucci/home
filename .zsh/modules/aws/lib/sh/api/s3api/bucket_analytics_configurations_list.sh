aws_s3api_bucket_analytics_configurations_list() {
    local bucket="$1"
    shift 1

    log_and_run aws s3api list-bucket-analytics-configurations --bucket $bucket "$@"
}
