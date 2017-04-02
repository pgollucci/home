aws_configservice_config_snapshot_deliver() {
    local delivery-channel-name="$1"
    shift 1

    cond_log_and_run aws configservice  --delivery-channel-name $delivery_channel_name "@"

}
