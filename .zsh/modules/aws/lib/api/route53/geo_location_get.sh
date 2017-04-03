aws_route53_geo_location_get() {
    shift 0

    log_and_run aws route53 get-geo-location "$@"
}
