aws_configservice_delivery_channel_put() {
    local delivery-channel="$1"
    shift 1

    cond_log_and_run aws configservice  --delivery-channel $delivery_channel "@"

}
