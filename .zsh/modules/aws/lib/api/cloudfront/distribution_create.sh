aws_cloudfront_distribution_create() {
    shift 0

    cond_log_and_run aws cloudfront create-distribution "$@"
}
