aws_shield_subscription_delete() {
    shift 0

    cond_log_and_run aws shield delete-subscription "$@"
}
