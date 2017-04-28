aws_route53_traffic_policy_instances_by_policy_list() {
    local traffic_policy_id="$1"
    local traffic_policy_version="$2"
    shift 2

    log_and_run aws route53 list-traffic-policy-instances-by-policy --traffic-policy-id $traffic_policy_id --traffic-policy-version $traffic_policy_version "$@"
}
