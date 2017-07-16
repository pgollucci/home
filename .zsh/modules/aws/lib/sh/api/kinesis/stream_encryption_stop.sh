aws_kinesis_stream_encryption_stop() {
    local stream_name="$1"
    local encryption_type="$2"
    local key_id="$3"
    shift 3

    cond_log_and_run aws kinesis stop-stream-encryption --stream-name $stream_name --encryption-type $encryption_type --key-id $key_id "$@"
}
