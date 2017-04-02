aws_cloudfront_streaming_distribution_update() {
    local streaming-distribution-config="$1"
    local id="$2"
    shift 2

    cond_log_and_run aws cloudfront  --streaming-distribution-config $streaming_distribution_config --id $id "@"

}
