aws_route53_geo_locations_list() {
    shift 0

    log_and_run aws route53 list-geo-locations "$@"
}
