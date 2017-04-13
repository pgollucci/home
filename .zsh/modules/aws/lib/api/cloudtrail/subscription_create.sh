aws_cloudtrail_subscription_create() {

    cond_log_and_run aws cloudtrail create-subscription "$@"
}
