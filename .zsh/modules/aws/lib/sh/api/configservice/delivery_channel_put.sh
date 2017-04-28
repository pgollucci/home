aws_configservice_delivery_channel_put() {
    local delivery_channel="$1"
    shift 1

    cond_log_and_run aws configservice put-delivery-channel --delivery-channel $delivery_channel "$@"
}
