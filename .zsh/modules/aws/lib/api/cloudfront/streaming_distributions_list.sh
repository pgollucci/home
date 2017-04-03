aws_cloudfront_streaming_distributions_list() {
    shift 0

    log_and_run aws cloudfront list-streaming-distributions "$@"
}
