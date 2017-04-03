aws_configservice_delivery_channel_status_describe() {
    shift 0

    log_and_run aws configservice describe-delivery-channel-status "$@"
}
