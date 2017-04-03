aws_firehose_destination_update() {
    local delivery_stream_name="$1"
    local current_delivery_stream_version_id="$2"
    local destination_id="$3"
    shift 3

    cond_log_and_run aws firehose update-destination --delivery-stream-name $delivery_stream_name --current-delivery-stream-version-id $current_delivery_stream_version_id --destination-id $destination_id "$@"
}
