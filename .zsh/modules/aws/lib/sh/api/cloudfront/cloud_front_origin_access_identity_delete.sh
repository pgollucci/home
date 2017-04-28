aws_cloudfront_cloud_front_origin_access_identity_delete() {
    local id="$1"
    shift 1

    cond_log_and_run aws cloudfront delete-cloud-front-origin-access-identity --id $id "$@"
}
