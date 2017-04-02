aws_cloudfront_invalidation_get() {
    local id="$1"
    local distribution-id="$2"
    shift 2

    log_and_run aws cloudfront  --id $id --distribution-id $distribution_id "@"

}
