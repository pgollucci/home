aws_cloudfront_streaming_distribution_create() {
    local streaming-distribution-config="$1"
    shift 1

    cond_log_and_run aws cloudfront  --streaming-distribution-config $streaming_distribution_config "@"

}
