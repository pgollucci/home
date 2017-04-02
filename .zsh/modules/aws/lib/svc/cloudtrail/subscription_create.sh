aws_cloudtrail_subscription_create() {
    shift 0

    cond_log_and_run aws cloudtrail  "@"

}
