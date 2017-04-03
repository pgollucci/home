aws_cloudfront_cloud_front_origin_access_identities_list() {
    shift 0

    log_and_run aws cloudfront list-cloud-front-origin-access-identities "$@"
}
