aws_cloudfront_invalidation_get() {
    local distribution_id="$1"
    local id="$2"
    shift 2

    log_and_run aws cloudfront get-invalidation --distribution-id $distribution_id --id $id "$@"
}
