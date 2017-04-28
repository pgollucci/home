aws_cloudfront_streaming_distribution_create() {
    local streaming_distribution_config="$1"
    shift 1

    cond_log_and_run aws cloudfront create-streaming-distribution --streaming-distribution-config $streaming_distribution_config "$@"
}
