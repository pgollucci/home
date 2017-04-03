aws_route53_hosted_zones_by_name_list() {
    shift 0

    log_and_run aws route53 list-hosted-zones-by-name "$@"
}
