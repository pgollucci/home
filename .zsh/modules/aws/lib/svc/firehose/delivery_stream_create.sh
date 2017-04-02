aws_firehose_delivery_stream_create() {
    local delivery-stream-name="$1"
    shift 1

    cond_log_and_run aws firehose  --delivery-stream-name $delivery_stream_name "@"

}
