aws_cloudfront_cloud_front_origin_access_identity_config_get() {
    local id="$1"
    shift 1

    log_and_run aws cloudfront  --id $id "@"

}
