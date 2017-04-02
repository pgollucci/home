aws_cloudtrail_subscription_update() {
    shift 0

    cond_log_and_run aws cloudtrail  "@"

}
