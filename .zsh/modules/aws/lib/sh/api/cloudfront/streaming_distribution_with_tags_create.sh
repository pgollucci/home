aws_cloudfront_streaming_distribution_with_tags_create() {
    local streaming_distribution_config_with_tags="$1"
    shift 1

    cond_log_and_run aws cloudfront create-streaming-distribution-with-tags --streaming-distribution-config-with-tags $streaming_distribution_config_with_tags "$@"
}
