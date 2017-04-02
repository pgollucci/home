aws_cloudfront_cloud_front_origin_access_identity_create() {
    local cloud-front-origin-access-identity-config="$1"
    shift 1

    cond_log_and_run aws cloudfront  --cloud-front-origin-access-identity-config $cloud_front_origin_access_identity_config "@"

}
