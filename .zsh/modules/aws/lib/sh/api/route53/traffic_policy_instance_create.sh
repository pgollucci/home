aws_route53_traffic_policy_instance_create() {
    local hosted_zone_id="$1"
    local name="$2"
    local ttl="$3"
    local traffic_policy_id="$4"
    local traffic_policy_version="$5"
    shift 5

    cond_log_and_run aws route53 create-traffic-policy-instance --hosted-zone-id $hosted_zone_id --name $name --ttl $ttl --traffic-policy-id $traffic_policy_id --traffic-policy-version $traffic_policy_version "$@"
}
