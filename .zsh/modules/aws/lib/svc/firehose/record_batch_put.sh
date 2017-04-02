aws_firehose_record_batch_put() {
    local records="$1"
    local delivery-stream-name="$2"
    shift 2

    cond_log_and_run aws firehose  --records $records --delivery-stream-name $delivery_stream_name "@"

}
