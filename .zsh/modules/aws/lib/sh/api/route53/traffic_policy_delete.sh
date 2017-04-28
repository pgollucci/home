aws_route53_traffic_policy_delete() {
    local id="$1"
    local traffic_policy_version="$2"
    shift 2

    cond_log_and_run aws route53 delete-traffic-policy --id $id --traffic-policy-version $traffic_policy_version "$@"
}
