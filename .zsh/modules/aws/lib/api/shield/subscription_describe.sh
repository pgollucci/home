aws_shield_subscription_describe() {
    shift 0

    log_and_run aws shield describe-subscription "$@"
}
