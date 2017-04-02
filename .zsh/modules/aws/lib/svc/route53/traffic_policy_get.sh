aws_route53_traffic_policy_get() {
    local id="$1"
    local traffic-policy-version="$2"
    shift 2

    log_and_run aws route53  --id $id --traffic-policy-version $traffic_policy_version "@"

}
