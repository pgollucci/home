aws_s3api_bucket_notification_put() {
    local bucket="$1"
    local notification_configuration="$2"
    shift 2

    cond_log_and_run aws s3api put-bucket-notification --bucket $bucket --notification-configuration $notification_configuration "$@"
}
