aws_route53_traffic_policy_comment_update() {
    local id="$1"
    local comment="$2"
    local traffic_policy_version="$3"
    shift 3

    cond_log_and_run aws route53 update-traffic-policy-comment --id $id --comment $comment --traffic-policy-version $traffic_policy_version "$@"
}
