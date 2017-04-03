aws_configservice_delivery_channel_delete() {
    local delivery_channel_name="$1"
    shift 1

    cond_log_and_run aws configservice delete-delivery-channel --delivery-channel-name $delivery_channel_name "$@"
}
