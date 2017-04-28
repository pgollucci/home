aws_route53_hosted_zones_list() {

    log_and_run aws route53 list-hosted-zones "$@"
}
