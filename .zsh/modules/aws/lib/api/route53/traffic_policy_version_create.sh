aws_route53_traffic_policy_version_create() {
    local id="$1"
    local document="$2"
    shift 2

    cond_log_and_run aws route53 create-traffic-policy-version --id $id --document $document "$@"
}
