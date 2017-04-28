aws_cloudfront_distribution_create() {

    cond_log_and_run aws cloudfront create-distribution "$@"
}
