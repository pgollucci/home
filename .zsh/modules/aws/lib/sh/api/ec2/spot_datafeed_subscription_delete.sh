aws_ec2_spot_datafeed_subscription_delete() {

    cond_log_and_run aws ec2 delete-spot-datafeed-subscription "$@"
}
