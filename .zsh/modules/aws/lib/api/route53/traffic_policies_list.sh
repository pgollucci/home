aws_route53_traffic_policies_list() {
    shift 0

    log_and_run aws route53 list-traffic-policies "$@"
}
