aws_route53_traffic_policy_instance_create() {
    local hosted-zone-id="$1"
    local ttl="$2"
    local traffic-policy-id="$3"
    local traffic-policy-version="$4"
    local name="$5"
    shift 5

    cond_log_and_run aws route53  --hosted-zone-id $hosted_zone_id --ttl $ttl --traffic-policy-id $traffic_policy_id --traffic-policy-version $traffic_policy_version --name $name "@"

}
