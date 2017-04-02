aws_route53_traffic_policy_instances_by_hosted_zone_list() {
    local hosted-zone-id="$1"
    shift 1

    log_and_run aws route53  --hosted-zone-id $hosted_zone_id "@"

}
