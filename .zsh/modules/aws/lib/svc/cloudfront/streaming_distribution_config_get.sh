aws_cloudfront_streaming_distribution_config_get() {
    local id="$1"
    shift 1

    log_and_run aws cloudfront  --id $id "@"

}
