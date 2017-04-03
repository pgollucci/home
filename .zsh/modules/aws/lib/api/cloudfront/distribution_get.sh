aws_cloudfront_distribution_get() {
    local id="$1"
    shift 1

    log_and_run aws cloudfront get-distribution --id $id "$@"
}
