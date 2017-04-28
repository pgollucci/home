aws_firehose_record_batch_put() {
    local delivery_stream_name="$1"
    local records="$2"
    shift 2

    cond_log_and_run aws firehose put-record-batch --delivery-stream-name $delivery_stream_name --records $records "$@"
}
