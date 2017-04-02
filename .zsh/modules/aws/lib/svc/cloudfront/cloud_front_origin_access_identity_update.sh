aws_cloudfront_cloud_front_origin_access_identity_update() {
    local id="$1"
    local cloud-front-origin-access-identity-config="$2"
    shift 2

    cond_log_and_run aws cloudfront  --id $id --cloud-front-origin-access-identity-config $cloud_front_origin_access_identity_config "@"

}
