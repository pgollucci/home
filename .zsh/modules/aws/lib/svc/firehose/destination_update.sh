aws_firehose_destination_update() {
    local destination-id="$1"
    local delivery-stream-name="$2"
    local current-delivery-stream-version-id="$3"
    shift 3

    cond_log_and_run aws firehose  --destination-id $destination_id --delivery-stream-name $delivery_stream_name --current-delivery-stream-version-id $current_delivery_stream_version_id "@"

}
