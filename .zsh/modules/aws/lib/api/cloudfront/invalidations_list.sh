aws_cloudfront_invalidations_list() {
    local distribution_id="$1"
    shift 1

    log_and_run aws cloudfront list-invalidations --distribution-id $distribution_id "$@"
}
