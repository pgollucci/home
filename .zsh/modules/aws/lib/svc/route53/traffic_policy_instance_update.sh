aws_route53_traffic_policy_instance_update() {
    local traffic-policy-id="$1"
    local ttl="$2"
    local traffic-policy-version="$3"
    local id="$4"
    shift 4

    cond_log_and_run aws route53  --traffic-policy-id $traffic_policy_id --ttl $ttl --traffic-policy-version $traffic_policy_version --id $id "@"

}
