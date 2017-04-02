aws_route53_traffic_policy_instances_by_policy_list() {
    local traffic-policy-id="$1"
    local traffic-policy-version="$2"
    shift 2

    log_and_run aws route53  --traffic-policy-id $traffic_policy_id --traffic-policy-version $traffic_policy_version "@"

}
