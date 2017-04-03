aws_cloudfront_invalidation_create() {
    local distribution_id="$1"
    shift 1

    cond_log_and_run aws cloudfront create-invalidation --distribution-id $distribution_id "$@"
}
