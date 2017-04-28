aws_s3api_bucket_notification_get() {
    local bucket="$1"
    shift 1

    log_and_run aws s3api get-bucket-notification --bucket $bucket "$@"
}
