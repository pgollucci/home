aws_sns_subscriptions_list() {
    shift 0

    log_and_run aws sns list-subscriptions "$@"
}
