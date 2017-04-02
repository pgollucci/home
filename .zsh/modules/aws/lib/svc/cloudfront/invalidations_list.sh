aws_cloudfront_invalidations_list() {
    local distribution-id="$1"
    shift 1

    log_and_run aws cloudfront  --distribution-id $distribution_id "@"

}
