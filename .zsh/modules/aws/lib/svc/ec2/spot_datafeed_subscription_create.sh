aws_ec2_spot_datafeed_subscription_create() {
    local bucket="$1"
    shift 1

    cond_log_and_run aws ec2  --bucket $bucket "@"

}
