aws_cloudfront_streaming_distribution_delete() {
    local id="$1"
    shift 1

    cond_log_and_run aws cloudfront delete-streaming-distribution --id $id "$@"
}
