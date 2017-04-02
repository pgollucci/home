aws_s3api_bucket_logging_put() {
    local bucket="$1"
    local bucket-logging-status="$2"
    shift 2

    cond_log_and_run aws s3api  --bucket $bucket --bucket-logging-status $bucket_logging_status "@"

}
