aws_route53_traffic_policy_comment_update() {
    local id="$1"
    local traffic-policy-version="$2"
    local comment="$3"
    shift 3

    cond_log_and_run aws route53  --id $id --traffic-policy-version $traffic_policy_version --comment $comment "@"

}
