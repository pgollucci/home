aws_cloudfront_cloud_front_origin_access_identity_update() {
    local cloud_front_origin_access_identity_config="$1"
    local id="$2"
    shift 2

    cond_log_and_run aws cloudfront update-cloud-front-origin-access-identity --cloud-front-origin-access-identity-config $cloud_front_origin_access_identity_config --id $id "$@"
}
