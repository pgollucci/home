aws_s3api_bucket_notification_configuration_put() {
    local notification-configuration="$1"
    local bucket="$2"
    shift 2

    cond_log_and_run aws s3api  --notification-configuration $notification_configuration --bucket $bucket "@"

}
