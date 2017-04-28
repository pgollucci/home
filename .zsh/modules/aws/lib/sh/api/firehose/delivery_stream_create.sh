aws_firehose_delivery_stream_create() {
    local delivery_stream_name="$1"
    shift 1

    cond_log_and_run aws firehose create-delivery-stream --delivery-stream-name $delivery_stream_name "$@"
}
