aws_cloudfront_distributions_list() {
    shift 0

    log_and_run aws cloudfront list-distributions "$@"
}
