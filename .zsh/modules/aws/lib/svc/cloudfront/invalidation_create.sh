aws_cloudfront_invalidation_create() {
    local distribution-id="$1"
    shift 1

    cond_log_and_run aws cloudfront  --distribution-id $distribution_id "@"

}
