aws_firehose_delivery_stream_delete() {
    local delivery_stream_name="$1"
    shift 1

    cond_log_and_run aws firehose delete-delivery-stream --delivery-stream-name $delivery_stream_name "$@"
}
