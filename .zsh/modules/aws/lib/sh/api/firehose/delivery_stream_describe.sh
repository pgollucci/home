aws_firehose_delivery_stream_describe() {
    local delivery_stream_name="$1"
    shift 1

    log_and_run aws firehose describe-delivery-stream --delivery-stream-name $delivery_stream_name "$@"
}
