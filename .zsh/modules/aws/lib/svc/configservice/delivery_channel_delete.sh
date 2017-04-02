aws_configservice_delivery_channel_delete() {
    local delivery-channel-name="$1"
    shift 1

    cond_log_and_run aws configservice  --delivery-channel-name $delivery_channel_name "@"

}
