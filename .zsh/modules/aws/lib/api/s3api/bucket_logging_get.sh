aws_s3api_bucket_logging_get() {
    local bucket="$1"
    shift 1

    log_and_run aws s3api get-bucket-logging --bucket $bucket "$@"
}
